//
//  main.swift
//  Singleton
//
//  Created by Managam Silalahi on 2/20/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

var server = BackupServer.server;
let queue = dispatch_queue_create("workQueue", DISPATCH_QUEUE_CONCURRENT);
let group = dispatch_group_create();
for count in 0 ..< 100 {
    dispatch_group_async(group, queue, {() in
        BackupServer.server.backup(DataItem(type: DataItem.ItemType.Email,
            data: "bob@example.com"))
    });
}
dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
print("\(server.getData().count) items were backed up");

//BackupServer.server.backup(DataItem(type: .Email, data: "managam.silalahi@gmail.com"))
//BackupServer.server.backup(DataItem(type: .Phone, data: "123-323-322"))
//globalLogger.log("Backed up 2 items to \(BackupServer.server.name)")
//
//BackupServer.server.backup(DataItem(type: DataItem.ItemType.Email, data: "bob@example.com"))
//globalLogger.log("Backed up 1 item to \(BackupServer.server.name)");
//
//globalLogger.printLog()




