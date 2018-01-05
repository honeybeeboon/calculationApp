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
    
    @IBAction func inputNum(_ sender: UIButton) {
        resultLabel.text = sender.titleLabel!.text
        
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

