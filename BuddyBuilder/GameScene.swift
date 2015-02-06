//
//  GameScene.swift
//  BuddyBuilder
//
//  Created by Kristian Andersen on 06/02/15.
//  Copyright (c) 2015 Robocat. All rights reserved.
//

import SpriteKit

enum GameState {
    case Playing
    case Paused
    case Countdown
    case GameOver
}

class GameScene: SKScene {
    var state: GameState = .Playing
    var level1: Level!
	
    override func didMoveToView(view: SKView) {
        self.size = CGSize(width: 1024, height: 822)
        
        level1 = Level(player: "")
        level1.position = CGPoint(x: 256, y: 411)
        addChild(level1)
    }
}
