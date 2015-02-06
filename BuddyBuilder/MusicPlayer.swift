//
//  SoundPlayer.swift
//  BuddyBuilder
//
//  Created by Kristian Andersen on 06/02/15.
//  Copyright (c) 2015 Robocat. All rights reserved.
//

import AVFoundation

class MusicPlayer {
    var player: AVAudioPlayer!
    
    init(fileURL: NSURL) {
        var error: NSError?
        
        player = AVAudioPlayer(contentsOfURL: fileURL, error: &error)
        player.numberOfLoops = -1
        player.prepareToPlay()
    }
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.pause()
    }
}
