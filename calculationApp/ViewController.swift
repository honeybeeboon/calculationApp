//
//  ViewController.swift
//  calculationApp
//
//  Created by 下澤一輝 on 2018/01/03.
//  Copyright © 2018年 下澤一輝. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    var userInput = false
    var resultNum:String = "0"
    @IBAction func inputNum(_ sender: UIButton) {
        if(!userInput){

            userInput = true
            resultNum = sender.titleLabel!.text!
        }else{
 
            resultNum = resultLabel.text!
            resultNum += (sender.titleLabel?.text!)!
        }
        resultLabel.text = resultNum
        
    }
    
    @IBAction func plusMinus(_ sender: Any) {
        if(Int(resultNum)! > 0){
            resultNum = "-" + resultNum
        }else{
            resultNum = resultNum.replacingOccurrences(of: "-", with: "")
        }
        resultLabel.text = resultNum
    }
    
    @IBAction func percent(_ sender: Any) {
        if(resultNum != "0"){
            resultNum = String(Double(resultNum)! * 0.01)
        }
        resultLabel.text = resultNum
    }
    
    @IBAction func clear(_ sender: Any) {
        
        resultNum = ""
        resultLabel.text = "0"
        userInput = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

