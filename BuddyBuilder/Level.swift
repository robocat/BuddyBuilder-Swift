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

let layout1 = Layout(obstacles: [
    ObstaclePosition(type: .Sofa, position: CGPoint(x: 40, y: 320), angle: M_PI),
    ObstaclePosition(type: .Table, position: CGPoint(x: 150, y: 325), angle: 0),
    ObstaclePosition(type: .Plant, position: CGPoint(x: 200, y: 460), angle: 0),
    ObstaclePosition(type: .Plant, position: CGPoint(x: 430, y: 40), angle: 0),
    ObstaclePosition(type: .Desk, position: CGPoint(x: 430, y: 120), angle: 0),
    ObstaclePosition(type: .Plant, position: CGPoint(x: 430, y: 250), angle: 0),
    ObstaclePosition(type: .Stool, position: CGPoint(x: 440, y: 580), angle: 0),
    ObstaclePosition(type: .BloodyTable, position: CGPoint(x: 350, y: 630), angle: 0)
])

class Level: SKSpriteNode {
//    var player: Player!
    
    let maxNumberOfPatients = 10
    var patients: [Patient] = []
	
	let doctor = Doctor(texture: nil, color: nil, size: CGSize(width: 96, height: 96))
    
    convenience init(player: String) {
        
        let color = NSColor.redColor()
        let texture = SKTexture(imageNamed: "floor_player1")
        let size = texture.size()
        
        self.init(texture: texture, color: color, size: size)
        
        self.zPosition = 1
        
        configureObstacles()
        configureWall()
    }
    
    func configureWall() {
        physicsBody = SKPhysicsBody(edgeLoopFromRect: frame)
        physicsBody?.affectedByGravity = false
        physicsBody?.dynamic = false
    }
    
<<<<<<< HEAD
    func configurePlayer() {
		addChild(doctor)
		doctor.position = CGPoint(x: 0, y: 0)
		
//        player.position = CGPointMake((frame.size.width - player.size.width) / 2, (frame.size.height - player.size.height) / 2)
//        player.zPosition = 3
//        addChild(player)
    }
    
=======
>>>>>>> 51006eef0946bdc44012aa2ca58739e72819fd35
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
    
    private func configurePhysics() {
        self.physicsBody = SKPhysicsBody(texture: texture, size: size)
        physicsBody?.affectedByGravity = false
        physicsBody?.dynamic = false
    }
    
    func configureObstacles() {
        for obstacle in layout1.obstacles {
            let node = Obstacle(type: obstacle.type)
            let x = -(anchorPoint.x * size.width) + obstacle.position.x
            let y = -(anchorPoint.y * size.height) + obstacle.position.y
            node.position = CGPoint(x: x, y: y)
            node.zRotation = CGFloat(obstacle.angle)
            node.zPosition = 2
            
            addChild(node)
        }
    }
    
<<<<<<< HEAD
    func spawnPatients() {
        if patients.count <= maxNumberOfPatients {
            if (Float(arc4random()) / Float(UINT32_MAX)) < 0.01 {
                addPatient()
            }
        }
    }
    
    func addPatient() {
//        let patient = Patient(level: self)
//        
//        var x = CGFloat(randomRange(400, min: 80))
//        var y = CGFloat(randomRange(700, min: 80))
//        
//        // Check if position collides with obstacle
//        
//        patient.position = CGPoint(x: x, y: y)
//        patient.zRotation = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
//        patient.moveRandom(0.6)
//        
//        addChild(patient)
//        patients.append(patient)
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
    
    private func randomRange(max: Int, min: Int) -> Float {
        return floorf(Float(arc4random()) / Float(UINT32_MAX) * (Float(max) - Float(min))) + Float(min)
=======
    func update(timePassed: NSTimeInterval) {
        
>>>>>>> 51006eef0946bdc44012aa2ca58739e72819fd35
    }
}
