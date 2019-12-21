//
//  ViewController.swift
//  tipcal
//
//  Created by Duy Tran Vinh Thai on 12/20/19.
//  Copyright © 2019 Duy Tran Vinh Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipPercentageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func customTip(_ sender: Any) {
        tipControl.selectedSegmentIndex = -1
        tipPercentageField.text = ""
        tipPercentageField.becomeFirstResponder()
    }
    
    @IBAction func autoCalculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        var tipPercentage = (Double(tipPercentageField.text!) ?? 0) / 100
        
        let tipSample = [0.15, 0.2, 0.25]
        if(tipControl.selectedSegmentIndex != -1){
        tipPercentage = tipSample[tipControl.selectedSegmentIndex]
        tipPercentageField.text = String(format: "%d", tipPercentage * 100)
        }
        
        let tip = bill * tipPercentage
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

