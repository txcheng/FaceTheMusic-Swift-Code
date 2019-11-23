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
        VStack (alignment:.leading){
            Button(action: {self.routingObserver.currentPage = "main"}) {
                NavigationBarBackButton()
            }.frame(alignment:.leading).padding(.leading, 5)
            Divider()
            //Show selected picture if there is one
            image?.resizable()
            Spacer()
            HStack{
                
                Button(action: {self.showCamera = true}) {
                    NavigationBarButton(buttonText:"Take a picture")
                } .padding([.leading, .trailing], 20)
                //Show analyze picture button if there is a picture
                //navigate to a different view to show the results of the analyzed picture
                if image != nil{
                    Button(action:{
                        self.findEmotion = true
                    }){
                        NavigationBarButton(buttonText:"Analyze picture!")
                    }.padding(.leading,20)
                }
            }
            Spacer()
        }.sheet(isPresented: self.$showCamera){
            CameraView(showCamera: self.$showCamera, image: self.$image, emotion: self.$emotion)
        }
    }
}

struct TakeAPictureView_Previews: PreviewProvider {
    static var previews: some View {
        TakeAPictureView().environmentObject(RoutingObserver())
    }
}

//style this button to be in a nav bar
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

struct NavigationBarButton: View {
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

