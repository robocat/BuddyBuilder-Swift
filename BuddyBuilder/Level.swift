//
//  Level.swift
//  BuddyBuilder
//
//  Created by Kristian Andersen on 06/02/15.
//  Copyright (c) 2015 Robocat. All rights reserved.
//

import Foundation
import SpriteKit

struct ObstaclePosition {
    let type: ObstacleType
    let position: CGPoint
    let angle: Double
}

struct Layout {
    let obstacles: [ObstaclePosition]
}

class Level: SKSpriteNode {

    let layouts: [Layout] = [
        Layout(obstacles: [
            ObstaclePosition(type: .Sofa, position: CGPoint(x: 40, y: 320), angle: M_PI),
            ObstaclePosition(type: .Table, position: CGPoint(x: 150, y: 325), angle: 0),
            ObstaclePosition(type: .Plant, position: CGPoint(x: 200, y: 460), angle: 0),
            ObstaclePosition(type: .Plant, position: CGPoint(x: 450, y: 40), angle: 0),
            ObstaclePosition(type: .Desk, position: CGPoint(x: 450, y: 120), angle: 0),
            ObstaclePosition(type: .Plant, position: CGPoint(x: 450, y: 250), angle: 0),
            ObstaclePosition(type: .Stool, position: CGPoint(x: 440, y: 580), angle: 0),
            ObstaclePosition(type: .BloodyTable, position: CGPoint(x: 350, y: 630), angle: 0)
        ]),
        Layout(obstacles: [
            ObstaclePosition(type: .BloodyTable, position: CGPoint(x: 70, y: 170), angle: M_PI),
            ObstaclePosition(type: .BloodyTable, position: CGPoint(x: 70, y: 250), angle: M_PI),
            ObstaclePosition(type: .BloodyTable, position: CGPoint(x: 70, y: 530), angle: M_PI),
            ObstaclePosition(type: .BloodyTable, position: CGPoint(x: 70, y: 600), angle: M_PI),
            ObstaclePosition(type: .BloodyTable, position: CGPoint(x: 440, y: 170), angle: 0),
            ObstaclePosition(type: .BloodyTable, position: CGPoint(x: 440, y: 250), angle: 0),
            ObstaclePosition(type: .BloodyTable, position: CGPoint(x: 440, y: 530), angle: 0),
            ObstaclePosition(type: .BloodyTable, position: CGPoint(x: 440, y: 600), angle: 0),
            ObstaclePosition(type: .Plant, position: CGPoint(x: 40, y: 780), angle: 0),
            ObstaclePosition(type: .Stool, position: CGPoint(x: 90, y: 785), angle: 0)
        ])
    ]
    
    let maxNumberOfPatients = 10
    var patients: [Patient] = []
	
	var bounds : CGRect {
		return CGRect(origin: CGPoint(x:-size.width / 2, y: -size.height / 2), size: size)
	}
	
	let doctor = Doctor(texture: nil, color: nil, size: CGSize(width: 96, height: 96))
    
    convenience init(player: String) {
        
        let color = NSColor.redColor()
        let texture = SKTexture(imageNamed: "floor_player1")
        let size = texture.size()
        
        self.init(texture: texture, color: color, size: size)
        
        self.zPosition = 1
        
        configureObstacles()
		configurePlayer()
    }
    
    func configurePlayer() {
		doctor.position = CGPoint(x: 0, y: 0)
		doctor.keepInside = bounds
        
        addChild(doctor)
    }
    
    override init(texture: SKTexture!, color: NSColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
	func update(timePassed : NSTimeInterval) {
		for child in children {
			if let child = child as? Person {
				child.update(timePassed)
			}
		}
	}
    
    func randomLayout() -> Layout {
        let range = Range<UInt32>(start: 0, end: UInt32(layouts.count - 1))
        let rand = Int(Int.random(range))
        
        return layouts[rand]
    }
    
    func configureObstacles() {
        let layout = randomLayout()
        
        for obstacle in layout.obstacles {
            let node = Obstacle(type: obstacle.type)
            let x = -(anchorPoint.x * size.width) + obstacle.position.x
            let y = -(anchorPoint.y * size.height) + obstacle.position.y
            node.position = CGPoint(x: x, y: y)
            node.zRotation = CGFloat(obstacle.angle)
            node.zPosition = 2
            
            addChild(node)
        }
    }
    
	override func keyDown(theEvent : NSEvent) {
		for child in children {
			if let child = child as? SKNode {
				child.keyDown(theEvent)
			}
		}
	}
	
	override func keyUp(theEvent : NSEvent) {
		for child in children {
			if let child = child as? SKNode {
				child.keyUp(theEvent)
			}
		}
	}
}
