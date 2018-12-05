//
//  ResultUnit.swift
//  Core Image Application
//
//  Created by 颜值怪兽 on 2018/11/28.
//  Copyright © 2018 颜值怪兽. All rights reserved.
//

import Cocoa

class ResultUnit: NSViewController,NSCollectionViewDataSource {
    
    var imageFilterCollection:[ImageFilter] = []
    private var imageUnit: ImageUnit?
    private var filterUnit: FilterUnit?
    
    @IBOutlet weak var imageFilterCollectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let parent = self.parent{
            
            for controller in parent.children{
                
                if let childController_1 = controller as? ImageUnit{
                    imageUnit = childController_1
                    
                }else if let childController_2 = controller as? FilterUnit{
                    filterUnit = childController_2
                }
            }
        }
        
        imageFilterCollectionView.backgroundColors = [NSColor.clear]
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return  imageFilterCollection.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ImageFilterCollectionView"), for: indexPath)
        
        item.textField?.stringValue = imageFilterCollection[indexPath.item].imageDiscribe!
        item.imageView?.image = imageFilterCollection[indexPath.item].image!
        
        return item
    }
    
}

extension ResultUnit: NSCollectionViewDelegate {
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        
        let indexPath = indexPaths.first
        let image = imageFilterCollectionView!.item(at: indexPath!)?.imageView!.image
        imageUnit?.imageView.image = image
        imageUnit?.imageData = NSData(data: (image?.tiffRepresentation)!)
        filterUnit?.filter = imageFilterCollection[(indexPath?.last)!].filterName!
        filterUnit!.setSliders()
    }
    
}
