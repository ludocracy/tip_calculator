//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Peter Kong on 3/10/17.
//  Copyright © 2017 Peter Kong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if !defaults.boolForKey("defTipChanged") {
            let defaultTip = 20
            defaults.setInteger(defaultTip, forKey: "defaultTip")
            defaults.synchronize()
        }
        for index in 0...2 {
            tipSelector.setTitle("\(Helper.getTipPercentages()[index])%", forSegmentAtIndex: index)
        }
        tipSelector.selectedSegmentIndex = 1
        
        if Double(billField.text!) > 0 {
            calculateTip(self)
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

    @IBAction func returnTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        let tipDecimal = 0.01 * Double(Helper.getTipPercentages()[tipSelector.selectedSegmentIndex])
        let bill = Double(billField.text!) ?? 0.0
        let tip = bill * tipDecimal
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    

}

