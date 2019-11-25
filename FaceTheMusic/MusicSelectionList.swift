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
        VStack (alignment: .leading){
            Group{
                Button(action: {self.routingObserver.currentPage = "music"}) {
                    BackButton()
                }.frame(alignment:.leading).padding(.leading, 5)
                Divider()
            }
            Group{
                MusicList(songs:["happy", "sad", "neutral"])
            }
            Spacer()
        }.onAppear(perform:{self.audioPlayer.play(emotion:self.routingObserver.emotion)})
    }
}

struct MusicSelectionList_Previews: PreviewProvider {
    static var previews: some View {
        MusicSelectionList()
    }
}

struct BackButton : View {
    var body: some View {
        return Text("< Go back")
            .foregroundColor(Color.blue)
    }
}

struct MusicList: View{
    let songs: [String]
    
    var body: some View{
        return List{
            ForEach(songs, id:\.self){ song in
                MusicRow(songTitle:song)
                }
            }
        }
    }

struct MusicRow: View{
    var songTitle: String
    var body: some View{
        HStack{
            Text(songTitle)
            Spacer()
            //make the select as default window pop up
            Button(action:{print("Clicked Row")}){
                Text("")
            }
            //play the selected song
            Button(action:{}){
                Text("Play song")
            }.onTapGesture(perform:{
                //.onAppear(perform:{self.audioPlayer.play(emotion:self.routingObserver.emotion)})
                //play the song title
                print("Clicked Button!")
            }).padding().background(Color.blue).foregroundColor(Color.white)
        }
    }
}

//make an object Song (has the url and title of song)
