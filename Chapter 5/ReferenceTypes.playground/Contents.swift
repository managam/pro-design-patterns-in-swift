//: Playground - noun: a place where people can play

import UIKit

class Location {
    var name: String
    var address: String
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
}

class Appointment {
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
        return Appointment(name: self.name, day: self.day, place: self.place)
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
