//
//  RentalCar.swift .swift
//  FactoryMethod
//
//  Created by Managam Silalahi on 3/8/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

protocol RentalCar {
    var name: String { get }
    var passangers: Int { get }
    var pricePerDay: Float { get }
}

class Compact: RentalCar {
    var name = "VW Golf"
    var passangers = 3
    var pricePerDay: Float = 20
}

class Sports: RentalCar {
    var name = "Porsche Boxter"
    var passangers = 1
    var pricePerDay: Float = 100
}

class SUV: RentalCar {
    var name = "Cadillac Escalade"
    var passangers = 8
    var pricePerDay: Float = 75
}
