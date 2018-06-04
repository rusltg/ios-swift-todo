//
//  CategoryTableViewController.swift
//  ToDo
//
//  Created by R on 02.06.2018.
//  Copyright © 2018 Ruslan Stetsenko. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet var colorButtons: [UIButton]!
    
    var selectedColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedColor = Model.colors[0]
        colorButtons.forEach {
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 2
            $0.layer.borderColor = $0.tag == 0 ? self.view.tintColor.cgColor : Model.colors[$0.tag].cgColor
            $0.backgroundColor = Model.colors[$0.tag]
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameTextField.becomeFirstResponder()
    }
    
    // MARK: - Action
    
    @IBAction func add(_ sender: Any) {
        nameTextField.text = nameTextField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        if nameTextField.text!.count > 0 {
            Model.add(category: Category(name: nameTextField.text!, color: selectedColor))
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func selectColor(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        selectedColor = Model.colors[tag]
        colorButtons.forEach {
            $0.layer.borderColor = $0.tag == tag ? self.view.tintColor.cgColor : Model.colors[$0.tag].cgColor
        }
    }
    
}
