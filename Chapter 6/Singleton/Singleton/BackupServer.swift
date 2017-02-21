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

final class BackupServer {
    let name: String
    private var data = [DataItem]()
    let arrayQ = DispatchQueue(label: "arrayQ")
    
    private init(name: String) {
        self.name = name
        globalLogger.log(message: "Created new server \(name)")
    }
    
    class var server: BackupServer {
        struct SingletonWrapper {
            static let singleton = BackupServer(name: "MainServer")
        }
        return SingletonWrapper.singleton
    }
    
    func backup(item: DataItem) {
        arrayQ.sync {
            data.append(item)
            globalLogger.log(message: "\(name) backed up item of type \(item.type.rawValue)")
        }
    }
    
    func getData() -> [DataItem] {
        return data
    }
}
