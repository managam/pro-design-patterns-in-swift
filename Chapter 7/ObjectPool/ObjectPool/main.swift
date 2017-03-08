//
//  main.swift
//  ObjectPool
//
//  Created by Managam Silalahi on 2/22/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

// Listing 7-6. Testing the Library and Pool in the main.swift File

var queue = DispatchQueue(label: "workQ", attributes: .concurrent)
var group = DispatchGroup()

print("Starting...")

for i in 1 ... 3 {
    queue.async(group: group, execute: {
        var book = Library.checkoutBook(reader: "reader#\(i)")
        if book != nil {
            sleep(arc4random() % 2)
            Library.returnBook(book: book!)
        }
    })
}

group.wait(timeout: .distantFuture)

print("All block are complete")
Library.printReport()

