//
//  main.swift
//  Singleton
//
//  Created by Managam Silalahi on 2/20/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

var server = BackupServer.server

let queue = DispatchQueue(label: "workQueue", attributes: .concurrent)
let group = DispatchGroup()

for count in 0 ..< 100 {
    queue.async(group: group, execute: {
        server.backup(item: DataItem(type: .Email, data: "managam.silalahi@gmail.com"))
    })
}

group.wait(timeout: .distantFuture)

print("\(server.getData().count) items were backed up")



//BackupServer.server.backup(item: DataItem(type: .Email, data: "managam.silalahi@gmail.com"))
//BackupServer.server.backup(item: DataItem(type: .Phone, data: "123-323-322"))
//globalLogger.log(message: "Backed up 2 items to \(BackupServer.server.name)")
//
//BackupServer.server.backup(item: DataItem(type: DataItem.ItemType.Email, data: "bob@example.com"))
//globalLogger.log(message: "Backed up 1 item to \(BackupServer.server.name)");
//
//globalLogger.printLog()




