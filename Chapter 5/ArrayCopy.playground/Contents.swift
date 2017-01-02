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

var people = [Person(name:"Joe", country:"France"),
              Person(name:"Bob", country:"USA")]
var otherPeople = people

people[0].country = "UK"
print("Country \(otherPeople[0].country)")
