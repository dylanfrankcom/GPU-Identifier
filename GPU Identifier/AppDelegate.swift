//
//  AppDelegate.swift
//  GPU Identifier
//
//  Created by Dylan Frankcom on 2020-01-17.
//  Copyright © 2020 Dylan Frankcom. All rights reserved.
//

import Cocoa
import IOKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    private let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    private let refreshTimeInterval = TimeInterval(2)
    private var timer: Timer?
    private var graphicsStatus = ""
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        timer = createTimer()
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit GPU Identifier",
                                action: #selector(NSApplication.terminate(_:)),
                                keyEquivalent: "q"))
        statusItem.menu = menu
        getInitialStatus()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func createTimer() -> Timer {
        return Timer.scheduledTimer(timeInterval: refreshTimeInterval,
                                    target: self,
                                    selector: #selector(self.getStatus),
                                    userInfo: nil,
                                    repeats: true)
    }
    
    private func updateUI(graphicsStatus: String?) {
        var icon: NSImage?
        
        switch graphicsStatus {
        case "IGPU":
            icon = #imageLiteral(resourceName: "Integrated")
        case "GFX0":
            icon = #imageLiteral(resourceName: "Dedicated")
        default:
            icon = #imageLiteral(resourceName: "Unknown")
        }
        
        DispatchQueue.main.async { [weak self] in
            if let button = self?.statusItem.button {
                button.image = icon
                button.image?.size = NSSize(width: 16.0, height: 16.0)
            }
        }
    }
    
    // Identifies the AppleMuxControl IOService and returns the ActiveGPU properties value
    private func getGraphicsStatus() -> String {
        return IORegistryEntryCreateCFProperty(IOServiceGetMatchingService(kIOMasterPortDefault,IOServiceNameMatching("AppleMuxControl")),
                                               "ActiveGPU" as CFString?,
                                               kCFAllocatorDefault, 0).takeUnretainedValue() as! String
        
    }
    
    // Get intial status of the GPU and set attributes accordingly
    func getInitialStatus() {
        // AppleMuxControl not found. Unsupported Mac. Terminate timer and set icon to unknown. Add an alert in the future
        if IOServiceGetMatchingService(kIOMasterPortDefault,IOServiceNameMatching("AppleMuxControl")) == 0 {
            updateUI(graphicsStatus: graphicsStatus)
            timer?.invalidate()
            return
        }
        graphicsStatus = getGraphicsStatus()
        updateUI(graphicsStatus: graphicsStatus)
    }
    
    // Used to get current status of the GPU and act only when the property value has changed
    @objc func getStatus() {
        if graphicsStatus != getGraphicsStatus() {
            graphicsStatus = getGraphicsStatus()
            updateUI(graphicsStatus: graphicsStatus)
        }
    }
}
