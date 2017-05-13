//
//  PageCollectionViewController.swift
//  WeightRecorder
//
//  Created by 渡辺拓也 on 2017/05/07.
//  Copyright © 2017年 渡辺拓也. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

struct Pages {
    var viewControllers:[UIViewController] = []
}

class PageCollectionViewController: UICollectionViewController {

    
    var pages:Pages = Pages(){
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let page1 = UIViewController()
        page1.view.backgroundColor = UIColor.yellow
        self.pages.viewControllers.append(page1)
        
        let page2 = UIViewController()
        page2.view.backgroundColor = UIColor.blue
        self.pages.viewControllers.append(page2)
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.pages.viewControllers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "PageCollectionViewCell",
            for: indexPath) as UICollectionViewCell
        
        let view = self.pages.viewControllers[indexPath.row].view
        cell.contentView.addSubview(view!)
        
        return cell
    }
    
    /// セルの大きさ
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let pageViewRect = self.view.bounds
        
        return CGSize(width: pageViewRect.width, height: pageViewRect.height)
    }
    
    /// 横のスペース
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0.0
        
    }
    
    /// 縦のスペース
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0.0

    }
}
