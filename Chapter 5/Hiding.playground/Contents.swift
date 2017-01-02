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
        if let detailed = message as? DetailedMessage  {
            messages.append(DetailedMessage(to: detailed.to, subject: detailed.subject, from: detailed.from))
        } else {
            messages.append(Message(to: message.to, subject: message.subject))
        }
    }
    
    func processMessage(callback: (Message) -> Void) {
        for message in messages {
            callback(message)
        }
    }
}

class DetailedMessage: Message {
    var from: String
    
    init(to: String, subject: String, from: String ) {
        self.from = from
        super.init(to: to, subject: subject)
    }
}

var logger = MessageLogger()
var message = Message(to: "Joe", subject: "Hello")
logger.logMessage(message: message)

message.to = "Bob"
message.subject = "Free for dinner?"
logger.logMessage(message: message)

var detailedMessage = DetailedMessage(to: "Alice", subject: "Hi!", from: "Joe")
logger.logMessage(message: detailedMessage)

logger.processMessage(callback: { (message) in
    if let detailed = message as? DetailedMessage  {
        print("Detailed Message - To: \(detailed.to) From: \(detailed.from) Subject: \(detailed.subject)")
    } else {
        print("Message - To: \(message.to) Subject: \(message.subject)");
    }
})

