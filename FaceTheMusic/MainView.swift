//
//  MainView.swift
//  FaceTheMusic
//
//  This is the main menu view
//  Upon button press, the user will be able to navigate to the indicated function/view
//
//  Created by Tracy Cheng on 10/17/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var routingObserver: RoutingObserver
    @EnvironmentObject var imageEmotionData: ImageEmotionData
    @EnvironmentObject var audioPlayer: AudioPlayer
    
    var body: some View {
        VStack {
            Spacer()
            //Title
            Text("Face the Music")
            .font(.largeTitle)
            
            Spacer()
            //Navigate to the Camera
            Button(action: {self.routingObserver.currentPage = "camera"})
            {
                MenuButtonContent(buttonText:"Take a picture!")
            }
            //space from the left and right edges
            .padding([.leading, .trailing], 20)
            
            Spacer()
            
            //Navigate to music
            Button(action:{
                self.routingObserver.currentPage = "music"
            }){
                MenuButtonContent(buttonText:"Customize music")
            }
            .padding([.leading, .trailing], 20)
            
            Spacer()
            
            //Navigate to more information
            Button(action:{
                self.routingObserver.currentPage = "about"
            }){
                MenuButtonContent(buttonText:"About me")
            }
            .padding([.leading, .trailing], 20)
            
            Spacer()
        }
    }
}

//this is for the preview/debugging
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(RoutingObserver()).environmentObject( ImageEmotionData())
    }
}

//makes the menu buttons with a given string
struct MenuButtonContent : View {
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
