//
//  BackupServer.swift
//  Singleton
//
//  Created by Managam Silalahi on 2/20/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

class DataItem {
    
    enum ItemType: String {
        case Email = "Email Address"
        case Phone = "Telephone Number"
        case Card = "Credit Card Number"
    }
    
    var type: ItemType
    var data: String
    
    init(type: ItemType, data: String) {
        self.type = type
        self.data = data
    }
}

class BackupServer {
    let name: String
    private var data = [DataItem]()
    
    init(name: String) {
        self.name = name
    }
    
    func backup(item: DataItem) {
        data.append(item)
    }
    
    func getData() -> [DataItem] {
        return data
    }
}