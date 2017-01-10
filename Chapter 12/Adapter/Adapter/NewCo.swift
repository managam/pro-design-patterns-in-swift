//
//  NewCo.swift
//  Adapter
//
//  Created by Managam Silalahi on 1/10/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

class NewCoStaffMember {
    fileprivate var name: String
    fileprivate var role: String
    
    init(name: String, role: String) {
        self.name = name
        self.role = role
    }
    
    func getName() -> String {
        return name
    }
    
    func getJob() -> String {
        return role
    }
}

class NewCoDirectory {
    fileprivate var staff: [String: NewCoStaffMember]
    
    init() {
        staff = ["Hans": NewCoStaffMember(name: "Hans", role: "Corp Counsel"),
                       "Greta": NewCoStaffMember(name: "Greta", role: "VP, Legal")]
    }
    
    func getStaff() -> [String: NewCoStaffMember] {
        return staff
    }
}

extension NewCoDirectory: EmployeeDataSource {
    var employees: [Employee] {
        return getStaff().values.map({ (sv) -> Employee in
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
        return getStaff().values.filter(filterClosure).map({ (entry) -> Employee in
            return Employee(name: entry.getName(), title: entry.getJob())
        })
    }
}
