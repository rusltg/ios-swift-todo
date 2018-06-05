//
//  DetailTableViewController.swift
//  ToDo
//
//  Created by R on 02.06.2018.
//  Copyright © 2018 Ruslan Stetsenko. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    var task: Task?
    var category: Category?
    var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = task != nil ? "Change Task" : "Add Task"
        
        if task != nil {
            titleTextField.text = task!.title
            categoryTextField.text = task!.category!.name
            dateTextField.text = task!.date!.dateTime
            
            if task!.isComplete {
                titleTextField.isEnabled = false
                categoryTextField.isEnabled = false
                dateTextField.isEnabled = false
            }
        }
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.backgroundColor = .white
        dateTextField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(changeDate), for: .valueChanged)
        
        categoryTextField.inputView = UIView()
    }

    
    // MARK: - Action
    
    @IBAction func save(_ sender: Any) {
        titleTextField.text = titleTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        if titleTextField.text!.count > 0 {
            if task != nil {
                task!.title = titleTextField.text!
                if category != nil {
                    task!.category = category!
                }
                if date != nil {
                    task!.date = date!
                }
                Model.change(task: task!)
                self.navigationController?.popViewController(animated: true)
            } else {
                if category != nil
                    && date != nil {
                    Model.addTask(category: category!, title: titleTextField.text!, date: date!, isComplete: false)
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    @IBAction func showCategories(_ sender: UITextField) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [unowned self] in
            self.view.endEditing(true)
            let alert = UIAlertController(title: "Select Category", message: nil, preferredStyle: .actionSheet)
            Model.categories().forEach { category in
                alert.addAction(UIAlertAction(title: category.name, style: .default, handler: { action in
                    self.category = category
                    self.categoryTextField.text = category.name
                }))
            }
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func changeDate(sender: UIDatePicker) {
        dateTextField.text = sender.date.dateTime
        date = sender.date
    }
}
