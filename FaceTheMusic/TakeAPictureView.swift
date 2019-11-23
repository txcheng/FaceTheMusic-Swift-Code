//
//  TakeAPictureView.swift
//  FaceTheMusic
//
//  Created by Tracy Cheng on 10/17/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import SwiftUI

struct TakeAPictureView: View {
    @EnvironmentObject var routingObserver: RoutingObserver
    
    @State private var showCamera: Bool = false
    @State private var image: Image? = nil
    @State private var findEmotion: Bool = false
    @State private var emotion: String = ""
    @State private var playMusic: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {self.routingObserver.currentPage = "main"}) {
                BackButtonContent()
            }
            //one button to choose from library
            Button(action: {self.showCamera = true}) {
                Text("Show camera")
                
            }
            //one button to choose to take a picture
            
            //Show selected picture if there is one
            //Show analyze picture button if there is a picture
            //navigate to a different view to show the results of the analyzed picture
            
            
        }.sheet(isPresented: self.$showCamera){
            CameraView(showCamera: self.$showCamera, image: self.$image, emotion: self.$emotion)
        }
    }

//    var body: some View {

//            image?.resizable()
            //display image if it is not nil
//            HStack{
                //display button
//                Button(action:{
//                    self.routingObserver.viewPage = "main"
//                    print(self.routingObserver.viewPage)
//                    self.showCamera = true
//                    self.findEmotion = false
//                    self.emotion = ""
//                    self.playMusic = false
//                })
//                {
//                    Text("Go back to menu")
//                    //show the camera view
//                }
                //show the next button if there is a picture
//                if image != nil{
//                    Button(action:{
//                        self.findEmotion = true
//                    }){
//                        Text("Analyze your picture")
//                    }
//                }
//            }
//        }
//        .sheet(isPresented: self.$showCamera){
//        CameraView(showCamera: self.$showCamera, image: self.$image, emotion: self.$emotion)
//        }
//    }
}

struct TakeAPictureView_Previews: PreviewProvider {
    static var previews: some View {
        TakeAPictureView().environmentObject(RoutingObserver())
    }
}

struct BackButtonContent : View {
    var body: some View {
        return Text("Go back to menu")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
    }
}
