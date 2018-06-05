//
//  TasksTableViewController.swift
//  ToDo
//
//  Created by R on 02.06.2018.
//  Copyright © 2018 Ruslan Stetsenko. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {

    var tasks: [Task] = []
    var completedTasks: [Task] = []
    var selectedTask: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        update()
    }
    
    
    // MARK: - Action
    
    func update() {
        tasks = Model.tasks()
        completedTasks = Model.tasks(isComplete: true)
        tableView.reloadData()
    }
    
    
    // MARK: - Table

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? tasks.count : completedTasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        cell.prepare(task: indexPath.section == 0 ? tasks[indexPath.row] : completedTasks[indexPath.row]) { [unowned self] task in
            Model.complete(task: task)
            self.update()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 1 && completedTasks.count > 0 ? "Completed" : nil
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0 {
                Model.remove(task: tasks[indexPath.row])
                tasks.remove(at: indexPath.row)
            } else {
                Model.remove(task: completedTasks[indexPath.row])
                completedTasks.remove(at: indexPath.row)
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTask = indexPath.section == 0 ? tasks[indexPath.row] : completedTasks[indexPath.row]
        performSegue(withIdentifier: "Change", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 && tasks.count == 0 ? 0.1 : super.tableView(tableView, heightForHeaderInSection: section)
    }

    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Change" {
            (segue.destination as! DetailTableViewController).task = selectedTask
        }
    }

}
