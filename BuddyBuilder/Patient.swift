//
//  Patient.swift
//  BuddyBuilder
//
//  Created by Ulrik Damm on 06/02/15.
//  Copyright (c) 2015 Robocat. All rights reserved.
//

import Foundation
import SpriteKit

class Patient : Person {
	enum Animation {
		case Stand
		case Walk
		case Run
	}
	
	let animations = Patient.loadAnimations()
	
	var animation : Animation = .Stand
	
	class func loadAnimations() -> [Animation: [SKTexture]] {
		let sprites = SKTexture(imageNamed: "patient").cut(6, 2)
		
		return [
			.Stand: [6].map { sprites[$0] },
			.Walk: [6, 7, 8, 9, 10, 11].map { sprites[$0] },
			.Run: [0, 1, 2, 3].map { sprites[$0] }
		]
	}
}

