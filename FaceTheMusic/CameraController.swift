//
//  cameraController.swift
//  FaceTheMusic
//
//  Created by Tracy Cheng on 10/17/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//
//  This Controller pulls up the user's picture collection

import Foundation
import SwiftUI

class CameraCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    //showing picture
    @Binding var isShown:Bool
    //image
    @Binding var image: Image?
    //resulting image
    @Binding var resultImage: Image?
    //string encoding
    @Binding var emotion: String
    
    //initilize variables
    init(isShown:Binding<Bool>, image:Binding<Image?>, emotion:Binding<String>, resultImage:Binding<Image?>){
        _isShown = isShown
        _image = image
        _emotion = emotion
        _resultImage = resultImage
    }
    
    //constructor
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //get the image
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //cast input image as image
        image = Image(uiImage: uiImage)
        //if there is an image, encode it into a base64 string
        let imgStr = uiImage.jpegData(compressionQuality: 1)?.base64EncodedString() ?? "failed"
        //send it to the API
        getEmotion(imgStr: imgStr)
        //get an emotion back
        isShown = false
    }
    
    //takes a base64 string and submits a post requst with the string as part of a json body
    //{"img": imgStr}
    //recieves a string and saves it as the "emotion" variable
    //recieves a json with [emotion] and [resultImage] keys
    func getEmotion(imgStr: String){
        let address = "http://4b194f05.ngrok.io"
        let url = URL(string:address)!
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.setValue("application/", forHTTPHeaderField: "Content-Type")
        let parameter: [String:Any] = [
            "img": imgStr
        ]
        let json = try? JSONSerialization.data(withJSONObject: parameter)
        request.httpBody = json
        
        let task = URLSession.shared.dataTask(with: request){
            data, response, error in
            guard let data = data,
            let response = response as? HTTPURLResponse,
            error == nil else{
                self.emotion = "Error connecting to server."
                    return
            }
            //data is the json
            //jsonreialization it
            //get the emotion
            //get the image
            //make the image into a UIImage
            print(response)
            let emotionPrediction = String(data: data, encoding: .utf8) ?? "failed"
            //get the new img too
            self.emotion = emotionPrediction
        }
        //do the post request
        task.resume()
    }

    //cancel button function
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

struct CameraController: UIViewControllerRepresentable{
    //showing picture
    @Binding var isShown:Bool
    //image
    @Binding var image: Image?
    //string encoding
    @Binding var emotion: String
    @Binding var resultImage: Image?
    
    //necessary function to override
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CameraController>) {
    }
    //declare CameraCoordinator as the coordinator
    func makeCoordinator() -> CameraCoordinator{
        return CameraCoordinator(isShown: $isShown, image: $image, emotion: $emotion, resultImage: $resultImage)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraController>) -> UIImagePickerController
    {
        let camera = UIImagePickerController()
        camera.delegate = context.coordinator
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            camera.sourceType = .camera
        }
        else{
            camera.sourceType = .photoLibrary
        }
        return camera
    }
}
