//
//  AppDelegate.swift
//  BuddyBuilder
//
//  Created by Ulrik Damm on 06/02/15.
//  Copyright (c) 2015 Robocat. All rights reserved.
//

import Cocoa
import SpriteKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var skView: SKView!

	func applicationDidFinishLaunching(aNotification: NSNotification) {
        let scene = GameScene()
        scene.scaleMode = .AspectFit
        
        self.skView?.presentScene(scene)
        self.skView?.ignoresSiblingOrder = true
        self.skView?.showsFPS = true
        self.skView?.showsNodeCount = true
	}

	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your application
	}


}

