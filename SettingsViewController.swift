//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Peter Kong on 3/10/17.
//  Copyright © 2017 Peter Kong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultTipDisplay: UISegmentedControl!
    
    lazy var curDefTip = Int()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        curDefTip = Helper.savedDefTip()
        
        tipStepper.value = Double(curDefTip)
        defaultTipDisplay.selectedSegmentIndex = 1

        setTipDisplay()
    }

    @IBOutlet weak var tipStepper: UIStepper!
    
    @IBAction func defaultTipStepper(_ sender: UIStepper) {
        let val = Int(sender.value)
        curDefTip = val
        setTipDisplay()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: NSUserDefaultsKeys.DEFAULT_TIP_CHANGED)
        defaults.set(curDefTip, forKey: NSUserDefaultsKeys.DEFAULT_TIP)
        defaults.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setTipDisplay() {
        for index in 0...2 {
            defaultTipDisplay.setTitle("\(Helper.getTipPercentages(curDefTip)[index])%", forSegmentAt: index)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
