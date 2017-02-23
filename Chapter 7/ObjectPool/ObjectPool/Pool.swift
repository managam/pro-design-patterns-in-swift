//
//  Pool.swift
//  ObjectPool
//
//  Created by Managam Silalahi on 2/23/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

class Pool<T> {
    private var data = [T]()
    private let arrayQ = DispatchQueue(label: "arrayQ")
    private let semaphore: DispatchSemaphore
    
    init(items: [T]) {
        data.reserveCapacity(data.count)
        for item in items {
            data.append(item)
        }
        semaphore = DispatchSemaphore(value: items.count)
    }
    
    func getFromPool() -> T? {
        var result: T?
        if semaphore.wait(timeout: .distantFuture) == .timedOut {
            arrayQ.sync {
                result = data.remove(at: 0)
            }
        }
        return result
    }
    
    func returnToPool(item: T) {
        arrayQ.sync {
            data.append(item)
            semaphore.signal()
        }
    }
}
