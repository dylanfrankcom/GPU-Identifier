//
//  Graphics.swift
//  GPU Identifier
//
//  Created by Dylan Frankcom on 2020-06-30.
//  Copyright © 2020 Dylan Frankcom. All rights reserved.
//

import Foundation
import Combine

class Graphics {
    @Published var status: String = "" {
        didSet {
        }
    }
    
    init() {
        self.status = IORegistryEntryCreateCFProperty(IOServiceGetMatchingService(kIOMasterPortDefault,IOServiceNameMatching("AppleMuxControl")), "ActiveGPU" as CFString?, kCFAllocatorDefault, 0).takeUnretainedValue() as! String
    }
 
    @discardableResult @objc func getStatus() -> Bool {
        var statusUpdated = false
        
        let newStatus = IORegistryEntryCreateCFProperty(IOServiceGetMatchingService(kIOMasterPortDefault,IOServiceNameMatching("AppleMuxControl")), "ActiveGPU" as CFString?, kCFAllocatorDefault, 0).takeUnretainedValue() as! String
        
        if self.status != newStatus {
            self.status = newStatus
            statusUpdated = true
        }
        
        return statusUpdated
    }
}
