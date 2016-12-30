//
//  Utils.swift
//  SportsStore
//
//  Created by Managam Silalahi on 12/30/16.
//  Copyright © 2016 Managam. All rights reserved.
//

import Foundation

class Utils {
    class func currencyString(fromNumber number: Double) -> String {
        let formatter = NumberFormatter();
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: number))!
    }
}
