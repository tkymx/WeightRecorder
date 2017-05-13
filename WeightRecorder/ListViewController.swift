//
//  ListViewController.swift
//  WeightRecorder
//
//  Created by 渡辺拓也 on 2017/05/06.
//  Copyright © 2017年 渡辺拓也. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var insTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
    //テーブルの要素数を設定する ※必須
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //テーブルの行数を設定する ※必須
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    //表示するセルの中身を設定する ※必須
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as? CustomTableViewCell
        
        let currentDay = getToDay(day : (Double)(-indexPath.row) )
        cell!.cellDate.text = currentDay
        cell!.cellWeight.text = DateManager.singleton.getWeight(day : currentDay)
        return cell!
    }
    
    //セルをタップした時に呼び出される
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let moveIndex = (Double)(-indexPath.row)
//        performSegue(withIdentifier: "weightRecorfScene", sender: moveIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "weightRecorfScene" {
//            let viewController = segue.destination as! ViewController
//            viewController.setCurrentDay = sender as! Double
        }
    }

}
