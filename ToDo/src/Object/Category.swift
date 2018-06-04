//
//  Category.swift
//  ToDo
//
//  Created by R on 03.06.2018.
//  Copyright © 2018 Ruslan Stetsenko. All rights reserved.
//

import UIKit

class Category {

    var id: String
    var name: String
    var color: UIColor
    
    init(name: String, color: UIColor) {
        self.id = UUID().uuidString
        self.name = name
        self.color = color
    }
}
