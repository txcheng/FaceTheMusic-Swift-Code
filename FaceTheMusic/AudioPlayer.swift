//
//  AudioPlayer.swift
//  FaceTheMusic
//
//  Created by Tracy Cheng on 11/23/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate{
    let objectWillChange = PassthroughSubject<AudioPlayer,Never>()
    //store file paths for the audio
    
    var audioPaths: [String:URL?] = [
        "happy":  Bundle.main.url(forResource: "happy", withExtension: "mp3", subdirectory: "Music/happy"),
        "sad": Bundle.main.url(forResource: "sad", withExtension: "mp3",subdirectory: "Music/sad"),
        "scared": Bundle.main.url(forResource: "scared", withExtension: "mp3",subdirectory: "Music/scared"),
        "neutral": Bundle.main.url(forResource: "neutral", withExtension: "mp3",subdirectory: "Music/neutral"),
        "angry": Bundle.main.url(forResource: "angry", withExtension: "mp3",subdirectory: "Music/angry")
    ]
                    
    //make audio session
    var audioSession = AVAudioSession.sharedInstance()
    //make audio player
    var player: AVAudioPlayer!
    
    var isPlaying: Bool = false{
        didSet{
            objectWillChange.send(self)
        }
    }
    
    func play(emotion:String){
        //access speakers
        do{
            try audioSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        }catch{
            print("Couldn't access speakers")
        }
        
        //play it
        do{
            //my program cannot find my audio files!
            player = try AVAudioPlayer(contentsOf:audioPaths[emotion]!!)
            player.delegate = self
            player.play()
            isPlaying = true
        }
        catch{
            print("Failed to play song")
        }
    }
    
    func stop(){
        //stop it
        player.stop()
        isPlaying = false
    }
}
