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
    var isEqual = false
    var isSymbol = false
    var resultNum:String = ""
    var secondNum:String = "0"
    var calcSymbol:String = ""
    @IBAction func inputNum(_ sender: UIButton) {
        if(!userInput){
            if(isEqual == true){
                userInput = true
                isEqual = false
                resultNum = sender.titleLabel!.text!
            }else{
                userInput = true
                resultNum += sender.titleLabel!.text!
            }
            if(sender.titleLabel!.text!=="0"){
                resultNum = ""
                userInput = false
            }else if(sender.titleLabel!.text!=="."){
                resultNum = "0."
            }
        }else{
            isSymbol = false
            if(resultNum.contains(".")&&sender.titleLabel!.text=="."){
                
            }else{
              resultNum += (sender.titleLabel?.text!)!
            }
        }
        resultLabel.text = resultNum
        if(resultNum == ""){
            resultLabel.text = "0"
        }
        
    }
    
    @IBAction func plusMinus(_ sender: Any) {
        if(resultNum != ""){
          if((Int(Double(resultNum)!)) >= 0){
             resultNum = "-" + resultNum
           }else{
            resultNum = resultNum.replacingOccurrences(of: "-", with: "")
           }
            resultLabel.text = resultNum
        }else{
            resultLabel.text = "0"
        }
       
    }
    
    @IBAction func percent(_ sender: Any) {
        if(resultNum != ""){
          if(resultNum != "0"){
            if(!resultNum.contains("=")){
              resultNum = String(Double(resultNum)! * 0.01)
            }
          }
          resultLabel.text = resultNum
        }else{
            resultLabel.text = "0"
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        resultNum = ""
        resultLabel.text = "0"
        userInput = false
        
    }
    @IBAction func Symbol(_ sender: UIButton) {
        userInput = true
      if(isSymbol != true){
        if(sender.titleLabel!.text == "＋"){
           resultNum += "+"
            resultLabel.text? += "+"
        }else if(sender.titleLabel!.text == "-"){
            resultNum += "-"
            resultLabel.text? += "-"
        }else if(sender.titleLabel!.text == "×"){
            resultNum += "×"
            resultLabel.text? += "×"
        }else if(sender.titleLabel!.text == "÷"){
            resultNum += "÷"
            resultLabel.text? += "÷"
        }
        isSymbol = true
     }
        
    }
    
    @IBAction func calc(_ sender: Any) {
        if(resultNum != "" && isSymbol != true){
            var calcNum = resultNum
            calcNum = calcNum.replacingOccurrences(of: "×", with: "*")
            calcNum = calcNum.replacingOccurrences(of: "÷", with: "/")
            var tempNum = calcNum
            print(tempNum)
            var minus:Character
            var isMinus = false
            if(tempNum[tempNum.startIndex] == "-"){
                minus = tempNum[tempNum.startIndex]
                tempNum.removeFirst()
                isMinus = true
            }
            var symList:[String] = []
            for symbol in tempNum{
                if(symbol == "*" || symbol == "+" || symbol == "-" || symbol == "/"){
                    symList.append(String(symbol))
                    if(tempNum.contains(String(symbol))){
                         tempNum = tempNum.replacingOccurrences(of: String(symbol), with: " ")
                    }
                }
            }
            symList.append(".")
            var NumList:[String] = tempNum.components(separatedBy: " ")
            
            for (index,num) in NumList.enumerated(){
                NumList[index] = String(Double(num)!)
            }
            
            let zipped = zip(NumList, symList)
            let joinNum = zipped.map{$0.0 + $0.1}
            calcNum = joinNum.joined()
            calcNum.removeLast()

            let expression = NSExpression(format : calcNum)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            resultNum = String(result)
            if(isMinus == true){
                resultNum = "-" + resultNum
                isMinus = false
            }
            resultLabel.text = String(resultNum)
            userInput = false
            isEqual = true
        }
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

