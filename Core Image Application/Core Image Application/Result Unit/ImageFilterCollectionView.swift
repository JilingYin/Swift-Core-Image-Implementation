//
//  ImageFilterCollectionView.swift
//  Core Image Application
//
//  Created by 颜值怪兽 on 2018/11/28.
//  Copyright © 2018 颜值怪兽. All rights reserved.
//

import Cocoa

class ImageFilterCollectionView: NSCollectionViewItem {
    
    
    override var isSelected: Bool {
        didSet {
            view.layer?.borderWidth = isSelected ? 4.0 : 0.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.borderColor = NSColor.white.cgColor
        view.layer?.borderWidth = 0.0
    }
}
