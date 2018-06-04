//
//  TaskCell.swift
//  ToDo
//
//  Created by R on 02.06.2018.
//  Copyright © 2018 Ruslan Stetsenko. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var categoryIndicatorView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func prepare(task: Task) {
        categoryLabel.text = task.category.name
        nameLabel.text = task.title
        dateLabel.text = task.date.dateTime
        categoryIndicatorView.backgroundColor = task.category.color
        selectView.backgroundColor = task.isComplete ? task.category.color : .clear
        selectView.layer.borderColor = task.category.color.cgColor
        selectView.layer.borderWidth = 2
        selectView.layer.cornerRadius = 15
    }

}
