//
//  main.swift
//  Singleton
//
//  Created by Managam Silalahi on 2/20/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

var server = BackupServer(name: "Server#1")
server.backup(item: DataItem(type: .Email, data: "managam.silalahi@gmail.com"))
server.backup(item: DataItem(type: .Phone, data: "123-323-322"))
globalLogger.log(message: "Backed up 2 items to \(server.name)")

var otherServer = BackupServer(name:"Server#2")
otherServer.backup(item: DataItem(type: DataItem.ItemType.Email, data: "bob@example.com"))
globalLogger.log(message: "Backed up 1 item to \(otherServer.name)");

globalLogger.printLog()




