//
//  main.swift
//  Adapter
//
//  Created by Managam Silalahi on 1/10/17.
//  Copyright © 2017 Managam. All rights reserved.
//

import Foundation

let search = SearchTool(dataSource: SalesDataSource(), EngineeringDataSource(), NewCoDirectoryAdapter())

print("--List--")
for e in search.employees {
    print("Name: \(e.name)")
}

print("--Search--")
for e in search.search(text: "VP", type: .title) {
    print("Name: \(e.name), Title: \(e.title)")
}

