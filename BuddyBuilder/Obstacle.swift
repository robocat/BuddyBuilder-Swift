//
//  Obstacle.swift
//  BuddyBuilder
//
//  Created by Kristian Andersen on 06/02/15.
//  Copyright (c) 2015 Robocat. All rights reserved.
//


import Foundation
import SpriteKit

enum ObstacleType: String {
    case Plant = "plant"
    case Table = "regular_table"
    case BloodyTable = "bloody_table"
    case Desk = "computer_table"
    case Sofa = "sofa"
    case Stool = "stool"
}

class Obstacle: SKSpriteNode {
    convenience init(type: ObstacleType) {
        let color = NSColor.clearColor()
        let texture = SKTexture(imageNamed: type.rawValue)
        let size = texture.size()
        
        self.init(texture: texture, color: color, size: size)
        
        physicsBody = SKPhysicsBody(texture: texture, size: size)
        physicsBody?.dynamic = false
        physicsBody?.affectedByGravity = false
    }
    
    override init(texture: SKTexture!, color: NSColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}