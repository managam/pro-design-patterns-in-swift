//
//  CarSelector.swift
//  FactoryMethod
//
//  Created by Managam Silalahi on 3/8/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

func createRentalCar(passengers: Int) -> RentalCar? {
    var car: RentalCar?
    
    switch (passengers) {
    case 0...1:
        car = Sports()
    case 2...3:
        car = Compact()
    case 4...8:
        car = SUV()
    case 9...14:
        car = Minivan()
    default:
        car = nil
    }
    
    return car
}

class CarSelector {
    class func selectCar(passengers: Int) -> String? {
        return createRentalCar(passengers: passengers)?.name
    }
}
