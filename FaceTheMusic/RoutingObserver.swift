//
//  RoutingObserver.swift
//  FaceTheMusic
//
//  Updates all observing views with state variable data
//
//  Created by Tracy Cheng on 11/22/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class RoutingObserver: ObservableObject {
    
    //don't change this variable name!
    let objectWillChange = PassthroughSubject<RoutingObserver,Never>()
    
    var currentPage: String = "main" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var emotion: String = ""{
        didSet{
            objectWillChange.send(self)
        }
    }
    var musicMap: [String:[Song]] = [:]
    
    func loadMusic(){
        //load the dictionary
        let musicFolder = Bundle.main.bundlePath+"/Music"
        if let files = try? FileManager.default.contentsOfDirectory(atPath: musicFolder){
            for file in files {
                var isDir: ObjCBool = ObjCBool(false)
                //if it is a directory
                if FileManager.default.fileExists(atPath: musicFolder+"/"+file, isDirectory: &isDir){
                    //load the music using the directory name as the key
                    if let songs = try? FileManager.default.contentsOfDirectory(atPath: musicFolder+"/"+file){
                        var songList: [Song] = []
                        for song in songs{
                            songList.append(Song(songTitle: song, songURL: URL(fileURLWithPath: musicFolder+"/"+file+"/"+song)))
                        }
                        musicMap[file] = songList
                    }
                }
            }
        }
    }
    
    //returns a list of songs
    func getMusic(emotion:String) -> [Song]?{
        return musicMap[emotion]
    }
    
    //make an object Song (has the url and title of song)
    struct Song{
        var songTitle: String
        var songURL: URL
    }
}
