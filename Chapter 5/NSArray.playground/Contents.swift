//: Playground - noun: a place where people can play

import UIKit

class Person: NSCopying {
    var name: String
    var country: String
    
    init(name: String, country: String) {
        self.name = name
        self.country = country
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Person(name: self.name, country: self.country)
    }
}

var data = NSMutableArray(objects: 10, "iOS", Person(name: "Joe", country: "USA"))
//var copiedData = data.mutableCopy() as! NSArray
//var copiedData = NSArray(array: [data], copyItems: true)
//var copiedData = data.mutableCopy() as! NSMutableArray
var copiedData = NSMutableArray(array: [data], copyItems: true)


data[0] = 20
data[1] = "MacOS"
(data[2] as! Person).name = "Alice"

print("Identity: \(data === copiedData)")
for data in copiedData[0] as! NSArray {
    if data is Person {
        print((data as! Person).name, (data as! Person).country)
    } else {
        print(data)
    }
}
//print("0: \(copiedData[0][0]) 1: \(copiedData[0][1]) 2: \((copiedData[0][2] as! Person).name)");

//copiedData[1] = "WatchOS"