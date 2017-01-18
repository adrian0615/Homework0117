//
//  TaskViewController.swift
//  Task
//
//  Created by Adrian McDaniel on 1/17/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class TaskListViewController: UITableViewController {
    
    let dataSource: TaskListDataSource = TaskListDataSource()
    var indexOfTaskToEdit: Int? = nil
    
    var tableView: UITableView {
        return view as! UITableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = dataSource
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}





class TaskListDataSource: NSObject, UITableViewDataSource {
    var tasks: [Task] = [
        Task(title: "homework", type: "schoolwork"),
        Task(title: "dishes", type: "housework"),
        Task(title: "wash car", type: "autowork"),
        Task(title: "buy groceries", type: "housework"),
        Task(title: "buy supplies", type: "schoolwork"),
        ]
    
    subscript(_ index: Int) -> Task {
        return tasks[index]
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
        let task = tasks[indexPath.row]
        
        cell.titleLabel.text = task.title
        cell.typeLabel.text = task.type
        return cell
    }
    
}
