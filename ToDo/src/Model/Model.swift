//
//  Model.swift
//  ToDo
//
//  Created by R on 03.06.2018.
//  Copyright © 2018 Ruslan Stetsenko. All rights reserved.
//

import UIKit
import CoreData

class Model: NSObject {

    static var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
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
    
    static func saveContext() {
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    static func addCategory(name: String, color: UIColor) {
        let category = Category(context: context)
        category.name = name
        category.color = color
        
        saveContext()
    }
    
    static func addTask(category: Category, title: String, date: Date, isComplete: Bool) {
        let task = Task(context: context)
        task.title = title
        task.date = date
        task.category = category
        
        saveContext()
    }
    
    static func categories() -> [Category] {
        do {
            return try context.fetch(NSFetchRequest(entityName: "Category"))
        } catch {}
        return []
    }
    
    static func change(task: Task) {
        saveContext()
    }

    static func remove(task: Task) {
        context.delete(task)
        saveContext()
    }
    
    static func tasks(isComplete: Bool = false) -> [Task] {
        do {
            let request: NSFetchRequest<Task> = Task.fetchRequest()
            request.predicate = NSPredicate(format: "isComplete == \(isComplete ? "true" : "false")")
            request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
            return try context.fetch(request)
        } catch {}
        return []
    }
    
    static func complete(task: Task) {
        task.isComplete = !task.isComplete
        saveContext()
    }

    
}
