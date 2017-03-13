//
//  Helper.swift
//  Tip Calculator
//
//  Created by Peter Kong on 3/13/17.
//  Copyright © 2017 Peter Kong. All rights reserved.
//

import UIKit

class Helper{
    static func savedDefTip() -> Int {
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.integerForKey("defaultTip")
    }
    
    static func getTipPercentages(givenTip: Int = 0) -> [Int] {
        let midTip = givenTip == 0 ? savedDefTip() : givenTip
        return [midTip - 2, midTip, midTip + 2]
    }
}
