//
//  Format.swift
//  ToDo
//
//  Created by R on 04.06.2018.
//  Copyright © 2018 Ruslan Stetsenko. All rights reserved.
//

import UIKit

extension Date {
    
    var dateTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm dd.MM.yyyy"
        return dateFormatter.string(from: self)
    }
}
