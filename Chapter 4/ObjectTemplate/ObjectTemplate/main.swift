//
//  main.swift
//  ObjectTemplate
//
//  Created by Managam Silalahi on 12/26/16.
//  Copyright © 2016 Managam. All rights reserved.
//

import Foundation

//var products = [Product(name: "Kayak", description: "A boat for one person",
//                        price: 275, stock: 10),
//                Product(name: "Lifejacket", description: "Protective and fashionable",
//                        price: 48.95, stock: 14),
//                Product(name: "Soccer Ball", description: "FIFA-approved size and weight",
//                        price: 19.5, stock: 32)]

var products = [
    Product(name: "Kayak", price: 275, stock: 10),
    Product(name: "Lifejacket", price: 48.95, stock: 14),
    Product(name: "Soccer Ball", price: 19.5, stock: 32)];

func calculateTax(product: Product) -> Double {
    return product.price * 0.2
}

func calculateStockValue(productsArray: [Product]) -> Double {
    return productsArray.reduce(0, { (total, product) -> Double in
        return total + (product.price + Double(product.stock))
    })
}

print("Sales tax for Kayak: $\(calculateTax(product: products[0]))");
print("Total value of stock: $\(calculateStockValue(productsArray: products))");


