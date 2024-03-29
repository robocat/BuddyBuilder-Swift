//
//  extensions.swift
//  BuddyBuilder
//
//  Created by Ulrik Damm on 06/02/15.
//  Copyright (c) 2015 Robocat. All rights reserved.
//

import Foundation
import Cocoa
import SpriteKit

let π = CGFloat(M_PI)

extension NSEvent {
	enum Key : Int {
		case Up = 126
		case Down = 125
		case Right = 124
		case Left = 123
		case Space = 49
	}
	
	var key : Key? {
		return Key(rawValue: Int(keyCode))
	}
}

extension SKTexture {
	func cut(horizontalSprites : Int, _ verticalSprites : Int) -> [SKTexture] {
		var sprites : [SKTexture] = []
		
		let width = CGFloat(1) / CGFloat(horizontalSprites)
		let height = CGFloat(1) / CGFloat(verticalSprites)
		let size = CGSize(width: width, height: height)
		
		for y in 0..<verticalSprites {
			for x in 0..<horizontalSprites {
				let point = CGPoint(x: width * CGFloat(x), y: height * CGFloat(y))
				let rect = CGRect(origin: point, size: size)
				sprites.append(SKTexture(rect: rect, inTexture: self))
			}
		}
		
		return sprites
	}
}

extension CGPoint {
	func clampToRect(rect : CGRect) -> CGPoint {
		var x = self.x
		var y = self.y
		
		if x < rect.origin.x {
			x = rect.origin.x
		} else if x > rect.origin.x + rect.size.width {
			x = rect.origin.x + rect.size.width
		}
		
		if y < rect.origin.y {
			y = rect.origin.y
		} else if y > rect.origin.y + rect.size.height {
			y = rect.origin.y + rect.size.height
		}
		
		return CGPoint(x: x, y: y)
	}
}

extension Int {
    static func random(range: Range<UInt32>) -> UInt32 {
        return range.startIndex + arc4random_uniform(range.endIndex - range.startIndex + 1)
    }
}
