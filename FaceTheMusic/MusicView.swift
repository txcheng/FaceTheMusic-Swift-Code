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
    
    var body: some View {
        VStack {
            NavigationBar()
            Divider()
            
            Spacer()
            
            //upon button click, the variable for emotion navigation changes
            VStack(spacing:50){
                //button for each emotion
                Button(action: {
                    self.routingObserver.currentPage = "options"
                    self.routingObserver.emotion = "happy"
                    //populate the song list
                })
                {
                    MenuButtonContent(buttonText:"Happy")
                }
                .padding([.leading, .trailing], 20)

                Button(action: {
                    self.routingObserver.currentPage = "options"
                    self.routingObserver.emotion = "sad"
                    //populate the song list
                })
                {
                    MenuButtonContent(buttonText:"Sad")
                }
                .padding([.leading, .trailing], 20)

                Button(action: {
                    self.routingObserver.currentPage = "options"
                    self.routingObserver.emotion = "angry"
                    //populate the song list
                })
                {
                    MenuButtonContent(buttonText:"Angry")
                }
                .padding([.leading, .trailing], 20)

                Button(action: {
                    self.routingObserver.currentPage = "options"
                    self.routingObserver.emotion = "scared"
                    //populate the song list
                })
                {
                    MenuButtonContent(buttonText:"Scared")
                }
                .padding([.leading, .trailing], 20)

                Button(action: {
                    self.routingObserver.currentPage = "options"
                    self.routingObserver.emotion = "neutral"
                    //populate the song list
                })
                {
                    MenuButtonContent(buttonText:"Neutral")
                }
                .padding([.leading, .trailing], 20)
                
            }
            Spacer()
        }
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView().environmentObject(RoutingObserver())
    }
}
