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
        VStack {
            Group{
                MusicBack()
                Divider()
            }
            Group{
                MusicList(songs:["happy", "sad", "neutral"])
            }
            Spacer()
        }.onAppear(perform:{
            self.audioPlayer.play(emotion:self.routingObserver.emotion)
            
        })
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
    //make this a list of Song objects with songTitle and URL
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
    @EnvironmentObject var routingObserver: RoutingObserver
    @EnvironmentObject var audioPlayer: AudioPlayer
    var songTitle: String
    var body: some View{
        HStack{
            Text(songTitle)
            Spacer()
            //play the song
            Button(action:{
                print("Play music")
                //play the song
                if(self.audioPlayer.isPlaying){
                    self.audioPlayer.stop()
                }
                else{
                    self.audioPlayer.play(emotion:self.routingObserver.emotion)
                }
            }){
                Text("")
            }
            Button(action:{}){
                Text("Set as default")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(40)
            .onTapGesture(perform:{
                //set the song as default
                print("set as default")
            })
        }
    }
}

//make an object Song (has the url and title of song)
struct Song{
    var songTitle: String
    var songURL: URL
}

struct MusicBack: View{
    @EnvironmentObject var routingObserver: RoutingObserver
    var body: some View{
        VStack (alignment:.leading){
            HStack{
                Button(action: {self.routingObserver.currentPage = "music"}) {
                                   BackButton()
                               }.frame(alignment:.leading).padding(.leading, 5)
            Spacer()
            }
        }
    }
}
