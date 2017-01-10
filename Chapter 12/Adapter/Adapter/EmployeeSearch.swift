//
//  EmployeeSearch.swift
//  Adapter
//
//  Created by Managam Silalahi on 1/10/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

class SearchTool {
    enum SearchType {
        case name
        case title
    }
    
    fileprivate let sources: [EmployeeDataSource]
    
    init(dataSource: EmployeeDataSource...) {
        self.sources = dataSource
    }
    
    var employees: [Employee] {
        var results = [Employee]()
        for source in sources {
            results += source.employees
        }
        
        return results
    }
    
    func search(text: String, type: SearchType) -> [Employee] {
        var results = [Employee]()
        
        for source in sources {
            results += type == .name ? source.searchByName(name: text) : source.searchByTitle(title: text)
        }
        
        return results
    }
}
