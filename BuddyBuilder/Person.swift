//
//  GameObject.swift
//  BuddyBuilder
//
//  Created by Ulrik Damm on 06/02/15.
//  Copyright (c) 2015 Robocat. All rights reserved.
//

import Foundation
import SpriteKit

class Person : SKSpriteNode {
	enum Direction : Int {
		case Up = 0
		case UpLeft = 1
		case Left = 2
		case DownLeft = 3
		case Down = 4
		case DownRight = 5
		case Right = 6
		case UpRight = 7
	}
	
	var walkingSpeed : CGFloat = 5
	var direction : Direction = .Up
	var walking : Bool = false
	
	func updateDirection() {
		zRotation = (π * 2) / 8 * CGFloat(direction.rawValue)
	}
	
	func update(timePassed : NSTimeInterval) {
		if walking {
			let speed = walkingSpeed * CGFloat(timePassed)
			let move = CGPoint(x: -sin(zRotation) * speed, y: cos(zRotation) * speed)
			position = CGPoint(x: position.x + move.x, y: position.y + move.y)
		}
	}
}
