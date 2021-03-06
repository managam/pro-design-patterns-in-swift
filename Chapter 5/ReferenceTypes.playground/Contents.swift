//: Playground - noun: a place where people can play

import UIKit

class Location: NSCopying {
    var name: String
    var address: String
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Location(name: self.name, address: self.address)
    }
}

class Appointment: NSCopying {
    var name: String
    var day: String
    var place: Location
    
    init(name: String, day: String, place: Location) {
        self.name = name
        self.day = day
        self.place = place
    }
    
    func printDetails(label: String) {
        print("\(label) with \(name) on \(day) at at \(place.name) \(place.address)")
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Appointment(name: self.name, day: self.day, place: self.place.copy() as! Location)
    }
}

var beerMeeting = Appointment(name: "Bob", day: "Mon", place:  Location(name:"Joe's Bar", address: "123 Main St"))
var workMeeting = beerMeeting.copy() as! Appointment
workMeeting.name = "Alice"
workMeeting.day = "Fri"
workMeeting.place.name = "Conference Rm 2"
workMeeting.place.address = "Company HQ"

beerMeeting.printDetails(label: "Social")
workMeeting.printDetails(label: "Work")
