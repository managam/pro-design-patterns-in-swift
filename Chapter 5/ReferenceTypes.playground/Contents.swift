//: Playground - noun: a place where people can play

import UIKit

class Appointment {
    var name: String
    var day: String
    var place: String
    
    init(name: String, day: String, place: String) {
        self.name = name
        self.day = day
        self.place = place
    }
    
    func printDetails(label: String) {
        print("\(label) with \(name) on \(day) at \(place)")
    }
}

var beerMeeting = Appointment(name: "Bob", day: "Mon", place: "Joe's Bar")
var workMeeting = beerMeeting
workMeeting.name = "Alice"
workMeeting.day = "Fri"
workMeeting.place = "Conference Rm 2"

beerMeeting.printDetails(label: "Social")
workMeeting.printDetails(label: "Work")
