//
//  ImageFilter.swift
//  Core Image Application
//
//  Created by 颜值怪兽 on 2018/11/28.
//  Copyright © 2018 颜值怪兽. All rights reserved.
//

import Cocoa

class ImageFilter{
    
    var filterName: String?
    var imageDiscribe: String?
    var image: NSImage?
    
    init(filterName: String, imageDiscribe: String, image: NSImage) {
        self.filterName = filterName
        self.imageDiscribe = imageDiscribe
        self.image = image
    }
    
}
