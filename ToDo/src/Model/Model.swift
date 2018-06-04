//
//  Model.swift
//  ToDo
//
//  Created by R on 03.06.2018.
//  Copyright © 2018 Ruslan Stetsenko. All rights reserved.
//

import UIKit

class Model: NSObject {

    static var isNotification: Bool {
        get {
            return UserDefaults.standard.object(forKey: "notification") != nil ? UserDefaults.standard.bool(forKey: "notification") : true
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "notification")
        }
    }
    
    static var colors: [UIColor] = [
        UIColor(0xc6da02),
        UIColor(0x79a700),
        UIColor(0xf68b2c),
        UIColor(0xe2b400),
        UIColor(0xf5522d),
        UIColor(0xff6e83)
    ]
    static var tasks: [Task] = []
    static var categories_: [Category] = [
        Category(name: "first", color: UIColor(0xc6da02)),
        Category(name: "second", color: UIColor(0x79a700))
    ]
    
    static func add(category: Category) {
        categories_.append(category)
    }
    
    static func categories() -> [Category] {
        return categories_
    }
    
    static func add(task: Task) {
        tasks.append(task)
    }
    
    static func change(task: Task) {
        for i in 0..<tasks.count {
            if tasks[i].id == task.id {
                tasks[i] = task
                break
            }
        }
    }

    static func remove(task: Task) {
        tasks = tasks.filter { $0.id != task.id }
    }
    
    static func tasks(isComplete: Bool = false) -> [Task] {
        return tasks.filter { $0.isComplete == isComplete }
    }
    
    static func complete(task: Task) {
        task.isComplete = true
    }

    
}
