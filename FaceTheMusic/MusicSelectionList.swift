//
//  MusicSelectionList.swift
//  
//
//  Created by Tracy Cheng on 11/24/19.
//

import SwiftUI

struct MusicSelectionList: View {
    @EnvironmentObject var routingObserver: RoutingObserver
    @EnvironmentObject var audioPlayer: AudioPlayer
    var body: some View {
        VStack (alignment:.leading){
            Button(action: {self.routingObserver.currentPage = "main"}) {
                NavigationBarBackButton()
            }.frame(alignment:.leading).padding(.leading, 5)
            Divider()
            
            //based on the emotion in the environment variable,
            //list the correct music files
            List{
                //for each music file in the directory, play and stop music on click of the row
                Text("Sound 1")
                Text("Sound 2")
            }
            
            Spacer()
        }.onAppear(perform:{self.audioPlayer.play(emotion:"angry")})
    }
}

struct MusicSelectionList_Previews: PreviewProvider {
    static var previews: some View {
        MusicSelectionList()
    }
}
