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
}
