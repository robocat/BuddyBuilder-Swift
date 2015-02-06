//
//  Doctor.swift
//  BuddyBuilder
//
//  Created by Ulrik Damm on 06/02/15.
//  Copyright (c) 2015 Robocat. All rights reserved.
//

import Foundation
import SpriteKit

class Doctor : Person {    
	override init(texture: SKTexture!, color: NSColor!, size: CGSize) {
		super.init(texture: texture, color: color, size: size)
		playAnimation(.Stand)
        configurePhysics()
	}
	
	enum Animation {
		case Stand
		case Walk
		case Slash
	}
	
	var animations = Doctor.loadAnimations()
	
	var animation : Animation = .Stand {
		didSet {
			if oldValue != animation {
				playAnimation(animation)
			}
		}
	}
	
	class func loadAnimations() -> [Animation: [SKTexture]] {
		let sprites = SKTexture(imageNamed: "doctor").cut(8, 2)
		
		return [
			.Stand: [8].map { sprites[$0] },
			.Walk: [8, 9, 10, 11, 12, 13, 14, 15].map { sprites[$0] },
			.Slash: [0, 1, 2, 3, 4, 5, 6, 7].map { sprites[$0] }
		]
	}
	
	func playAnimation(animation : Animation) {
		let sprites = animations[animation]!
		let action = SKAction.animateWithTextures(sprites, timePerFrame: 0.1)
		runAction(SKAction.repeatActionForever(action))
	}
    
    func configurePhysics() {
        physicsBody = SKPhysicsBody(texture: animations[.Stand]?[0], size: size)
        physicsBody?.affectedByGravity = false
        physicsBody?.dynamic = true
    }
	
	var upPressed = false
	var downPressed = false
	var leftPressed = false
	var rightPressed = false
	
	override func keyDown(theEvent: NSEvent) {
		switch theEvent.key {
		case .Some(.Up): upPressed = true
		case .Some(.Down): downPressed = true
		case .Some(.Left): leftPressed = true
		case .Some(.Right): rightPressed = true
		case _: break
		}
		
		updateCurrentDirection()
	}
	
	override func keyUp(theEvent: NSEvent) {
		switch theEvent.key {
		case .Some(.Up): upPressed = false
		case .Some(.Down): downPressed = false
		case .Some(.Left): leftPressed = false
		case .Some(.Right): rightPressed = false
		case _: break
		}
		
		updateCurrentDirection()
	}
	
	func updateCurrentDirection() {
		var walking = true
		
		switch (upPressed, downPressed, leftPressed, rightPressed) {
		case (true, _, true, _): direction = .UpLeft
		case (true, _, _, true): direction = .UpRight
		case (true, _, _, _): direction = .Up
		case (_, true, true, _): direction = .DownLeft
		case (_, true, _, true): direction = .DownRight
		case (_, true, _, _): direction = .Down
		case (_, _, true, _): direction = .Left
		case (_, _, _, true): direction = .Right
		case _: walking = false
		}
		
		if walking {
			animation = .Walk
			self.walking = true
		} else {
			animation = .Stand
			self.walking = false
		}
	}
}
