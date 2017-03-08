//
//  CarSelector.swift
//  FactoryMethod
//
//  Created by Managam Silalahi on 3/8/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

class CarSelector {
    
    class func selectCar(passangers: Int) -> String? {
        var car: RentalCar?
        
        switch passangers {
        case 0...1:
            car = Sports()
        case 2...3:
            car = Compact()
        case 4...8:
            car = SUV()
        default:
            car = nil
        }
        
        return car?.name
    }
}
