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
    @EnvironmentObject var imageEmotionData: ImageEmotionData
    
    @State private var showCamera: Bool = false
    //have the image be an environmentobject
    @State private var image: Image? = nil
    @State private var resultImage: Image? = nil
    @State private var findEmotion: Bool = false
    //have the emotion also be an environment object ?
    @State private var emotion: String = ""
    
    var body: some View {
        VStack {
            NavigationBar()
            Divider()
            //Show selected picture if there is one
            image?.resizable()
            Spacer()
            HStack{
                Button(action: {self.showCamera = true}) {
                    ActionButton(buttonText:"Take a picture")
                } .padding([.leading, .trailing], 20)
                //Show analyze picture button if there is a picture
                if image != nil{
                    //navigate to a different view to show the results of the analyzed picture
                    Button(action:{
                        self.routingObserver.currentPage = "result"
                        self.findEmotion = true
                        self.imageEmotionData.emotion = self.emotion
                        self.imageEmotionData.img = self.resultImage
                    }){
                        ActionButton(buttonText:"Analyze picture!")
                    }.padding(.trailing,20)
                }
            }
            Spacer()
        }.sheet(isPresented: self.$showCamera){
            CameraView(showCamera: self.$showCamera, image: self.$image, emotion: self.$emotion, resultImage: self.$resultImage)
        }
    }
}

struct TakeAPictureView_Previews: PreviewProvider {
    static var previews: some View {
        TakeAPictureView().environmentObject(RoutingObserver()).environmentObject( ImageEmotionData())
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

struct NavigationBarBackButton : View {
    var body: some View {
        return Text("< Go back to menu")
            .foregroundColor(Color.blue)
    }
}

struct ActionButton: View {
    var text: String
    
    init(buttonText: String){
        text = buttonText
    }
    
    var body: some View {
        return Text(text)
            //Make all the buttons the same width
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            //rounded corners
            .cornerRadius(60)
    }
}

struct NavigationBar: View{
    @EnvironmentObject var routingObserver: RoutingObserver
    var body: some View{
        VStack (alignment:.leading){
            HStack{
                Button(action: {self.routingObserver.currentPage = "main"}) {
                                   NavigationBarBackButton()
                               }.frame(alignment:.leading).padding(.leading, 5)
            Spacer()
            }
        }
    }
}
