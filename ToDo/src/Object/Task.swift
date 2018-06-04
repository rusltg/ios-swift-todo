//
//  Task.swift
//  ToDo
//
//  Created by R on 03.06.2018.
//  Copyright © 2018 Ruslan Stetsenko. All rights reserved.
//

import UIKit

class Task {

    var id: String
    var category: Category
    var title: String
    var date: Date
    var isComplete: Bool
    
    init(category: Category, title: String, date: Date, isComplete: Bool) {
        self.id = UUID().uuidString
        self.category = category
        self.title = title
        self.date = date
        self.isComplete = isComplete
    }
}
