//
//  Book.swift
//  ObjectPool
//
//  Created by Managam Silalahi on 2/22/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

class Book {
    let author: String
    let title: String
    let stockNumber: Int
    var reader: String?
    var checkoutCount = 0
    
    init(author: String, title: String, stock: Int) {
        self.author = author
        self.title = title
        self.stockNumber = stock
    }
}
