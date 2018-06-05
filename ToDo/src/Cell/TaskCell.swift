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
    
    var onComplete: ((_ task: Task) -> Void)!
    var task: Task!
    
    func prepare(task: Task, complete: @escaping (_ task: Task) -> Void) {
        categoryLabel.text = task.category!.name
        nameLabel.text = task.title
        dateLabel.text = task.date!.dateTime
        categoryIndicatorView.backgroundColor = task.category!.color as? UIColor
        selectView.backgroundColor = task.isComplete ? task.category!.color as! UIColor : .clear
        selectView.layer.borderColor = (task.category!.color as! UIColor).cgColor
        selectView.layer.borderWidth = 2
        selectView.layer.cornerRadius = 15
        
        onComplete = complete
        self.task = task
    }

    @IBAction func complete(_ sender: Any) {
        onComplete(task)
    }
}
