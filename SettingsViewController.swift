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

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        curDefTip = Helper.savedDefTip()
        
        tipStepper.value = Double(curDefTip)
        defaultTipDisplay.selectedSegmentIndex = 1

        setTipDisplay()
    }

    @IBOutlet weak var tipStepper: UIStepper!
    
    @IBAction func defaultTipStepper(sender: UIStepper) {
        let val = Int(sender.value)
        curDefTip = val
        setTipDisplay()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(true, forKey: "defTipChanged")
        defaults.setInteger(curDefTip, forKey: "defaultTip")
        defaults.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setTipDisplay() {
        for index in 0...2 {
            defaultTipDisplay.setTitle("\(Helper.getTipPercentages()[index])%", forSegmentAtIndex: index)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
