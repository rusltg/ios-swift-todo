//
//  SettingsTableViewController.swift
//  ToDo
//
//  Created by R on 02.06.2018.
//  Copyright © 2018 Ruslan Stetsenko. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var notificationSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notificationSwitch.isOn = Model.isNotification
    }

    
    // MARK: - Action
    
    @IBAction func notificationChange(_ sender: Any) {
        Model.isNotification = (sender as! UISwitch).isOn
    }
    
}
