//: Playground - noun: a place where people can play

import UIKit

class Message: NSCopying {
    var to: String
    var subject: String
    
    init(to: String, subject: String) {
        self.to = to
        self.subject = subject
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Message(to: self.to, subject: self.subject)
    }
}

class MessageLogger {
    var messages: [Message] = []
    
    func logMessage(message: Message) {
        messages.append(message.copy() as! Message)
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
    
    override func copy(with zone: NSZone?) -> Any {
        return DetailedMessage(to: self.to, subject: self.subject, from: self.from)
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

