//
//  Product.swift
//  ObjectTemplate
//
//  Created by Managam Silalahi on 12/27/16.
//  Copyright © 2016 Managam. All rights reserved.
//

import Foundation

class Product {
    var name: String = ""
    var description: String = ""
    var price: Double = 0.0
    var stock: Int = 0
    
    init(name: String, description: String, price: Double, stock: Int) {
        self.name = name
        self.description = description
        self.price = price
        self.stock = stock
    }
    
    init(name: String, price: Double, stock: Int) {
        self.name = name
        self.price = price
        self.stock = stock
    }
}
