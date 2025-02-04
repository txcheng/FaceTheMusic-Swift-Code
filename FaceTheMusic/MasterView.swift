//
//  MasterView.swift
//  FaceTheMusic
//
//  Created by Tracy Cheng on 11/22/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    //keeps track of pages changes
    @EnvironmentObject var routingObserver: RoutingObserver
    //keeps track of image and emotion
    @EnvironmentObject var imageEmotionData: ImageEmotionData
    //keeps track of audio playback
    @EnvironmentObject var audioPlayer: AudioPlayer
    
    var body: some View {
        VStack {
            if true{
                Text("").onAppear(perform:{self.routingObserver.loadMusic()})
            }
            if routingObserver.currentPage == "main" {
                if audioPlayer.isPlaying{
                    Text("").onAppear(perform:{self.audioPlayer.stop()})
                }
                MainView()
            } else if routingObserver.currentPage == "camera" {
                if audioPlayer.isPlaying{
                    Text("").onAppear(perform:{self.audioPlayer.stop()})
                }
                TakeAPictureView()
            }
            else if routingObserver.currentPage == "music"{
                if audioPlayer.isPlaying{
                    Text("").onAppear(perform:{self.audioPlayer.stop()})
                }
                MusicView()
            }
            else if routingObserver.currentPage == "about"{
                AboutMeView()
            }
            else if routingObserver.currentPage == "result"{
                EmotionResultView()
            }
            else if routingObserver.currentPage == "options"{
                MusicSelectionList()
            }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView().environmentObject(RoutingObserver()).environmentObject( ImageEmotionData()).environmentObject(AudioPlayer())
    }
}
