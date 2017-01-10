//
//  DataSources.swift
//  Adapter
//
//  Created by Managam Silalahi on 1/10/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

class DataSourceBase: EmployeeDataSource {
    var employees = [Employee]()
    
    func searchByName(name: String) -> [Employee] {
        return search({ (e) -> Bool in
            return e.name.range(of: name) != nil
        })
    }
    
    func searchByTitle(title: String) -> [Employee] {
        return search({ (e) -> Bool in
            return e.title.range(of: title) != nil
        })
    }
    
    fileprivate func search(_ selector: ((Employee) -> Bool)) -> [Employee] {
        var results = [Employee]()
        for e in employees {
            if (selector(e)) {
                results.append(e)
            }
        }
        
        return results
    }
}

class SalesDataSource: DataSourceBase {
    override init() {
        super.init()
        employees.append(Employee(name: "Henokh", title: "VP Marketing"))
        employees.append(Employee(name: "Silalahi", title: "VP Sales"))
    }
}

class EngineeringDataSource: DataSourceBase {
    override init() {
        super.init()
        employees.append(Employee(name: "Managam", title: "CTO"))
        employees.append(Employee(name: "Raja", title: "VP Engineering"))
    }
}
