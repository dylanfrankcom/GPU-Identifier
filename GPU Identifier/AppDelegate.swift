//
//  AppDelegate.swift
//  GPU Identifier
//
//  Created by Dylan Frankcom on 2020-01-17.
//  Copyright © 2020 Dylan Frankcom. All rights reserved.
//

import Cocoa
import IOKit
//import Combine

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusBarItem: NSStatusItem!
    var statusBarGraphicsStatus = NSMenuItem(title: "Initializing...", action: nil, keyEquivalent: "")
    private var graphicsCard = Graphics()
    private var timer: Timer?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
        statusBarItem.button?.image = #imageLiteral(resourceName: "Unknown")
        statusBarItem.button?.image?.size = NSSize(width: 16.0, height: 16.0)
        
        let statusBarMenu = NSMenu(title: "GPU Identifier")
        statusBarItem.menu = statusBarMenu
        
        statusBarMenu.addItem(statusBarGraphicsStatus)
        
        statusBarMenu.addItem(NSMenuItem.separator())
        
        statusBarMenu.addItem(NSMenuItem(title: "About GPU Identifier",
                                         action: nil,
                                         keyEquivalent: ""))
        
        statusBarMenu.addItem(NSMenuItem.separator())
        
        statusBarMenu.addItem(NSMenuItem(title: "Quit GPU Identifier",
                                         action: #selector(NSApplication.terminate(_:)),
                                         keyEquivalent: "q"))
        buildUI()
        
        let timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
        timer.tolerance = 1.0
        
        // Potential Combine implementation
        //let subscriber = GraphicsSubscriber()
        //graphicsCard.$status.subscribe(subscriber)
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        timer?.invalidate()
    }
    
    @objc func getGraphicsStatus() {
        graphicsCard.getStatus()
    }
    
    func buildUI() {
        if let button = self.statusBarItem.button {
            var icon: NSImage
            
            switch graphicsCard.status {
            case "IGPU":
                icon = #imageLiteral(resourceName: "Integrated")
                self.statusBarGraphicsStatus.title = "Using: Integrated Graphics"
            case "GFX0":
                icon = #imageLiteral(resourceName: "Dedicated")
                self.statusBarGraphicsStatus.title = "Using: Dedicated Graphics"
            default:
                icon = #imageLiteral(resourceName: "Unknown")
                self.statusBarGraphicsStatus.title = "Unsupported Device"
            }
            
            button.image = icon
            button.image?.size = NSSize(width: 16.0, height: 16.0)
            
        }
    }
    
    @objc func updateUI() {
        if graphicsCard.getStatus() {
            buildUI()
        }
    }
}
