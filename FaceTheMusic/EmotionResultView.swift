//
//  EmotionResultView.swift
//  FaceTheMusic
//
//  Created by Tracy Cheng on 11/23/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import SwiftUI

struct EmotionResultView: View {
    @EnvironmentObject var routingObserver: RoutingObserver
    @EnvironmentObject var imageEmotionData: ImageEmotionData
    @EnvironmentObject var audioPlayer: AudioPlayer
    
    var body: some View {
            VStack (alignment:.leading){
            Button(action: {self.routingObserver.currentPage = "camera"}) {
                BackButton()
            }.frame(alignment:.leading).padding(.leading, 5)
            Divider()
                
            //picture with bounding box and labeled emotion
            self.imageEmotionData.img?.resizable()

                //feed the emotion into the music player to play the correct music
            .onAppear(perform:{
//                    self.audioPlayer.play(emotion: self.imageEmotionData.emotion)
            })
            Spacer()
        }
    }
}

struct EmotionResultView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionResultView().environmentObject(RoutingObserver()).environmentObject(ImageEmotionData()).environmentObject(AudioPlayer())
    }
}
