//
//  PageViewController.swift
//  WeightRecorder
//
//  Created by 渡辺拓也 on 2017/05/07.
//  Copyright © 2017年 渡辺拓也. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)

        self.dataSource = self //追加
    }
    
    func getFirst() -> ViewController {
        return storyboard!.instantiateViewController(
            withIdentifier: "MainView") as! ViewController
    }
    
    func getSecond() -> ListViewController {
        return storyboard!.instantiateViewController(
            withIdentifier: "ListView") as! ListViewController
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        if viewController is ViewController {
            return getSecond()
        } else{
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController is ListViewController {
            return getFirst()
        } else {
            return nil
        }
    }
}
