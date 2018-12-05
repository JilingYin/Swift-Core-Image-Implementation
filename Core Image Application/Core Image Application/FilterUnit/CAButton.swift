//
//  CAButton.swift
//  Core Image Application
//
//  Created by 颜值怪兽 on 2018/12/3.
//  Copyright © 2018 颜值怪兽. All rights reserved.
//

import Cocoa

class CAButton: NSButton {

    override func awakeFromNib() {
        
        let trackingArea = NSTrackingArea(rect: self.bounds, options: NSTrackingArea.Options(rawValue: 129), owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea)
        
    }
    
    override func mouseEntered(with event: NSEvent) {
        
        self.image = NSImage(named: "CAHighLighted")
        
    }
    
    override func mouseExited(with event: NSEvent) {
        
        self.image = NSImage(named: "CANormal")
        
        
    }
    
}
