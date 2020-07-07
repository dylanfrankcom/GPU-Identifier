//
//  Graphics.swift
//  GPU Identifier
//
//  Created by Dylan Frankcom on 2020-06-30.
//  Copyright © 2020 Dylan Frankcom. All rights reserved.
//

import Foundation

class Graphics {
    var status: String = ""
    
    init() {
        if let activeGPU = IORegistryEntryCreateCFProperty(IOServiceGetMatchingService(kIOMasterPortDefault,IOServiceNameMatching("AppleMuxControl")), "ActiveGPU" as CFString?, kCFAllocatorDefault, 0) {
            self.status = activeGPU.takeUnretainedValue() as! String
        } else {
            self.status = "Unsupported"
        }
    }
 
    @discardableResult @objc func getStatus() -> Bool {
        var statusUpdated = false
        
        if let activeGPU = IORegistryEntryCreateCFProperty(IOServiceGetMatchingService(kIOMasterPortDefault,IOServiceNameMatching("AppleMuxControl")), "ActiveGPU" as CFString?, kCFAllocatorDefault, 0) {
            let newStatus = activeGPU.takeUnretainedValue() as! String
            
            if self.status != newStatus {
                self.status = newStatus
                statusUpdated = true
            }
        } else {
            self.status = "Unsupported"
            statusUpdated = true
        }
        
        return statusUpdated
    }
}
