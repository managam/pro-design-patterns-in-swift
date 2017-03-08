//
//  main.swift
//  FactoryMethod
//
//  Created by Managam Silalahi on 3/8/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

let passangers = [1, 3, 5]

for p in passangers {
    print("\(p) passangers: \(CarSelector.selectCar(passangers: p))")
}

