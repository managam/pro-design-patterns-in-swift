//
//  NewCoDirectoryAdapter.swift
//  Adapter
//
//  Created by Managam Silalahi on 1/10/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

class NewCoDirectoryAdapter: EmployeeDataSource {
    fileprivate let directory: NewCoDirectory
    
    init() {
        directory = NewCoDirectory()
    }
    
    var employees: [Employee] {
        return directory.getStaff().values.map({ (sv) -> Employee in
            return Employee(name: sv.getName(), title: sv.getJob())
        })
    }
    
    func searchByName(name: String) -> [Employee] {
        return createEmployees(filter: { (sv) -> Bool in
            return sv.getName().range(of: name) != nil
        })
    }
    
    func searchByTitle(title: String) -> [Employee] {
        return createEmployees(filter: { (sv) -> Bool in
            return sv.getJob().range(of: title) != nil
        })
    }
    
    fileprivate func createEmployees(filter filterClosure: ((NewCoStaffMember) -> Bool)) -> [Employee] {
        return directory.getStaff().values.filter(filterClosure).map({ (sv) -> Employee in
            return Employee(name: sv.getName(), title: sv.getJob())
        })
    }
    
}
