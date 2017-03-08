//
//  PriceCalculator.swift
//  FactoryMethod
//
//  Created by Managam Silalahi on 3/8/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

class PriceCalculator {
    class func calculatePrice(passengers: Int, days: Int) -> Float? {
        let car = createRentalCar(passengers: passengers)
        return car == nil ? nil : car!.pricePerDay * Float(days)
    }
}
