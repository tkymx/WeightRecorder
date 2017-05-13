//
//  ViewController.swift
//  WeightRecorder
//
//  Created by 渡辺拓也 on 2017/05/06.
//  Copyright © 2017年 渡辺拓也. All rights reserved.
//

import UIKit

func getToDay(day : Double = 0) -> String {
    
    let now = Date( timeInterval: 60*60*24*day, since: Date() as Date )
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: now as Date)

}


class DateManager {
    
    var dateToWeight : Dictionary<String,String> = [:]

    static let singleton = DateManager()
    private init(){
        for i in 10...20 {
            dateToWeight[getToDay(day:(Double)(-i))] = String((Int)(arc4random()) % 50+50);
        }
    }
    
    func saveWeight(day :String , weight : String){
        dateToWeight[day] = weight;
    }
    
    func ToString() -> String {
        var str : String = "";
        for (key, value) in dateToWeight {
            str += key + value + "\n";
        }
        return str;
    }
    
    func getWeight( day : String ) -> String {
        if dateToWeight.contains(where:{
            key,value in
            return key.contains(day)}){
            return dateToWeight[day]!;
        }
        return "";
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var test: UITextView!
    
    public var currentDay : Double = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentDay = 0;
        updateValue( );
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateValue( ){
        let curDay = getToDay( day : currentDay )
        date.text = curDay
        weightValue.text = String("\(DateManager.singleton.getWeight(day: curDay ))")
    }

    func saveWeight(){
        DateManager.singleton.saveWeight(
            day: getToDay( day : currentDay ),
            weight: weightValue.text! )
        
        test.text = DateManager.singleton.ToString();
    }
    
    func addNumber( number : String ){
        
        //:TODO 文字制限はここ
        if number == "0"{
            
            if weightValue.text!.isEmpty{
                return;
            }
        }
        else if number == "."{
            
            if weightValue.text!.isEmpty{
                return;
            }
            if weightValue.text!.contains("."){
                return;
            }

        }
        
        //小数点以上は3文字まで
        if number != "."{
            if !weightValue.text!.contains("."){
                let length = weightValue.text!.characters.count
                if length >= 4 {
                    return
                }
            }
        }
        
        //小数点以上二文字まで
        if weightValue.text!.contains("."){
            
            let length = weightValue.text!.characters.count

            let intIndex = weightValue.text!.distance(
                from : weightValue.text!.startIndex,
                to : weightValue.text!.range(of:".")!.lowerBound )

            if intIndex + 2 < length {
                return;
            }
        }
        

        
        weightValue.text = weightValue.text! + number;
    }
    
    @IBAction func one(_ sender: UIButton) {
        addNumber(number: "1")
        saveWeight();
    }
    
    @IBAction func two(_ sender: UIButton) {
        addNumber(number: "2" )
        saveWeight();
    }
    
    @IBAction func three(_ sender: UIButton) {
        addNumber(number: "3")
        saveWeight();
    }
    
    @IBAction func four(_ sender: UIButton) {
        addNumber(number: "4")
        saveWeight();
    }
    
    @IBAction func five(_ sender: UIButton) {
        addNumber(number: "5")
        saveWeight();
    }
    
    @IBAction func six(_ sender: UIButton) {
        addNumber(number: "6")
        saveWeight();
    }
    
    @IBAction func seven(_ sender: UIButton) {
        addNumber(number: "7")
        saveWeight();
    }
    
    @IBAction func eight(_ sender: UIButton) {
        addNumber(number: "8")
        saveWeight();
    }
    
    @IBAction func nine(_ sender: UIButton) {
        addNumber(number: "9")
        saveWeight();
    }
    
    @IBAction func zero(_ sender: UIButton) {
        addNumber(number: "0")
        saveWeight();
    
    }
    
    @IBAction func dot(_ sender: UIButton) {
        addNumber(number: "." )
    }
    
    @IBAction func back(_ sender: Any) {
        
        if weightValue.text!.isEmpty{
            return
        }
        
        let endpoint  = weightValue.text!.characters.count - 1;
        weightValue.text = (weightValue.text! as NSString).substring(to : endpoint);

        saveWeight();
    }
    
    @IBAction func clear(_ sender: UIButton) {
        weightValue.text = "";
        saveWeight();
    }
    
    @IBAction func NextDay(_ sender: UIButton) {
        currentDay += 1;
        updateValue();
    }
    
    @IBAction func PrevDay(_ sender: UIButton) {
        currentDay -= 1;
        updateValue();
    }
    
}

