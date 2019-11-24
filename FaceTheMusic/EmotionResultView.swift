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
    
    var body: some View {
            VStack (alignment:.leading){
            Button(action: {self.routingObserver.currentPage = "main"}) {
                NavigationBarBackButton()
            }.frame(alignment:.leading).padding(.leading, 5)
            Divider()
            //picture with bounding box
            self.imageEmotionData.img?.resizable()
                
            //emotion
            Text(self.imageEmotionData.emotion)
            //feed the emotion into the music player to play the correct music
            
            //back to take a picture
            Spacer()
        }
    }
}

struct EmotionResultView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionResultView().environmentObject(RoutingObserver()).environmentObject(ImageEmotionData())
    }
}
