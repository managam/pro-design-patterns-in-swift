//
//  Logger.swift
//  Singleton
//
//  Created by Managam Silalahi on 2/20/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

let globalLogger = Logger()

final class Logger {
    private var messages = [String]()
        
    fileprivate init() {
        // do nothing - required to stop instances being
        // created by code in other files
    }
    
    func log(message: String) {
        messages.append(message)
    }
    
    func printLog() {
        for message in messages {
            print("Log: \(message)")
        }
    }
}
