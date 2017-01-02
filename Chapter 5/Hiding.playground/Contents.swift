//: Playground - noun: a place where people can play

import UIKit

class Message {
    var to: String
    var subject: String
    
    init(to: String, subject: String) {
        self.to = to
        self.subject = subject
    }
}

class MessageLogger {
    var messages: [Message] = []
    
    func logMessage(message: Message) {
        messages.append(message)
    }
    
    func processMessage(callback: (Message) -> Void) {
        for message in messages {
            callback(message)
        }
    }
}

var logger = MessageLogger()
var message = Message(to: "Joe", subject: "Hello")
logger.logMessage(message: message)

message.to = "Bob"
message.subject = "Free for dinner?"
logger.logMessage(message: message)

logger.processMessage { (message) in
    print("Message - to: \(message.to), Subject: \(message.subject)")
}

