//
//  main.swift
//  FactoryMethod
//
//  Created by Managam Silalahi on 3/8/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

let passengers = [1, 3, 5, 10]

for p in passengers {
    print("\(p) passengers: \(CarSelector.selectCar(passengers: p))")
}

