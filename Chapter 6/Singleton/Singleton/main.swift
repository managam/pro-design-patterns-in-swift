//
//  main.swift
//  Singleton
//
//  Created by Managam Silalahi on 2/20/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

BackupServer.server.backup(DataItem(type: .Email, data: "managam.silalahi@gmail.com"))
BackupServer.server.backup(DataItem(type: .Phone, data: "123-323-322"))
globalLogger.log("Backed up 2 items to \(BackupServer.server.name)")

BackupServer.server.backup(DataItem(type: DataItem.ItemType.Email, data: "bob@example.com"))
globalLogger.log("Backed up 1 item to \(BackupServer.server.name)");

globalLogger.printLog()




