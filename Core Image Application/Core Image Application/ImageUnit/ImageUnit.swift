//
//  ImageUnit.swift
//  Core Image Application
//
//  Created by 颜值怪兽 on 2018/11/26.
//  Copyright © 2018 颜值怪兽. All rights reserved.
//

import Cocoa

class ImageUnit: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var imageCollectionView: NSCollectionView!
    
    private var resultUnit: ResultUnit?
    var imageHistory:[NSImage] = []
    var imageData: NSData?
    var originalImage: NSImage?
    var originalData: NSData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let parent = self.parent{
            
            for controller in parent.children{
                
                if let neededController = controller as? ResultUnit{
                    resultUnit = neededController
                    
                }
            }
        }
        
        imageCollectionView.backgroundColors = [NSColor.clear]
        
    }
    
}

extension ImageUnit: NSCollectionViewDelegate, NSCollectionViewDataSource {
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageHistory.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ImageCollectionItem"), for: indexPath)
        item.imageView?.image = imageHistory[indexPath.item]
        return item
    }
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        let indexPath = indexPaths.first
        let image = imageCollectionView!.item(at: indexPath!)?.imageView!.image
        originalImage = image
        originalData = NSData(data: (image?.tiffRepresentation)!)
        imageView.image = originalImage
        imageData = originalData
        
        resultUnit?.imageFilterCollection.removeAll()
        resultUnit?.imageFilterCollectionView.reloadData()
    }
    
}
