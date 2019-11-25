//
//  MusicView.swift
//  FaceTheMusic
//
//  Created by Tracy Cheng on 11/22/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import SwiftUI

struct MusicView: View {
    @EnvironmentObject var routingObserver: RoutingObserver
    @EnvironmentObject var audioPlayer: AudioPlayer
    var body: some View {
        VStack (alignment:.leading){
            
            Button(action: {self.routingObserver.currentPage = "main"}) {
                NavigationBarBackButton()
            }.frame(alignment:.leading).padding(.leading, 5)
            
            Divider()
            
            Spacer()
            
            //upon button click, the variable for emotion navigation changes
            VStack(spacing:50){
                //button for each emotion
                Button(action: {self.routingObserver.currentPage = "happy"})
                {
                    MenuButtonContent(buttonText:"Happy")
                }
                .padding([.leading, .trailing], 20)

                Button(action: {self.routingObserver.currentPage = "sad"})
                {
                    MenuButtonContent(buttonText:"Sad")
                }
                .padding([.leading, .trailing], 20)

                Button(action: {self.routingObserver.currentPage = "angry"})
                {
                    MenuButtonContent(buttonText:"Angry")
                }
                .padding([.leading, .trailing], 20)

                Button(action: {self.routingObserver.currentPage = "scared"})
                {
                    MenuButtonContent(buttonText:"Scared")
                }
                .padding([.leading, .trailing], 20)

                Button(action: {self.routingObserver.currentPage = "neutral"})
                {
                    MenuButtonContent(buttonText:"Neutral")
                }
                .padding([.leading, .trailing], 20)
                
            }
            Spacer()
        }
//        .onAppear(perform:{self.audioPlayer.play(emotion:"angry")})
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView().environmentObject(RoutingObserver())
    }
}
