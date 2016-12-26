//
//  main.swift
//  ObjectTemplate
//
//  Created by Managam Silalahi on 12/26/16.
//  Copyright © 2016 Managam. All rights reserved.
//

import Foundation

var products = [("Kayak", "A boat for one person", 275.0, 10),
    ("Lifejacket", "Protective and fashionable", 48.95, 14),
    ("Soccer Ball", "FIFA-approved size and weight", 19.5, 32)]

func calculateTax(product: (String, String, Double, Int) ) -> Double {
    return product.2 * 0.2
}

func calculateStockValue(tuples: [(String, String, Double, Int)]) -> Double {
    return tuples.reduce(0, { (total, product) -> Double in
        return total + (product.2 * Double(product.3))
    })
}

print("Sales tax for Kayak: \(calculateTax(product: products[0]))")
print("Total value of Stock: \(calculateStockValue(tuples: products))")


