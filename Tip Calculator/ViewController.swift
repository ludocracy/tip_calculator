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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        
        if !defaults.bool(forKey: NSUserDefaultsKeys.DEFAULT_TIP_CHANGED) {
            let defaultTip = 20
            defaults.set(defaultTip, forKey: NSUserDefaultsKeys.DEFAULT_TIP)
            defaults.synchronize()
        }
        for index in 0...2 {
            tipSelector.setTitle("\(Helper.getTipPercentages()[index])%", forSegmentAt: index)
        }
        tipSelector.selectedSegmentIndex = 1
        
        let savedLastBill = defaults.double(forKey: NSUserDefaultsKeys.LAST_BILL)

        if savedLastBill > 0 {
            billField.text = String(savedLastBill)
        }
        
        if getBill() > 0 {
            calculateTip(self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaults = UserDefaults.standard
        
        defaults.set(getBill(), forKey: NSUserDefaultsKeys.LAST_BILL)
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func returnTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipDecimal = 0.01 * Double(Helper.getTipPercentages()[tipSelector.selectedSegmentIndex])
        let bill = getBill()
        let tip = bill * tipDecimal
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func getBill() -> Double {
        return Double(billField.text!) ?? 0.0
    }
}

