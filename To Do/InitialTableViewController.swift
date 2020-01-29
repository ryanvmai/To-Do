//
//  InitialTableViewController.swift
//  To Do
//
//  Created by Ryan Mai on 1/22/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import UIKit
import Foundation

class InitialTableViewController: UITableViewController {
    //UserDefaults Set up
    let defaults = UserDefaults.standard
    //Variables that will be matched with UserDefaults
    var tasks: [String] = []
    var deletedTasks: [String] = []
    var completed: [Bool] = []
    var points: Int = 0
    var completedTasks: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //User dafults stuff
        if let taskData = defaults.array(forKey: "tasks") as? [String] {
            // successfully found the saved data!
            tasks = taskData
        } else {
            // No data saved (first time only, probably!
            defaults.set([String](), forKey: "tasks")
        }
        if let deletedTaskData = defaults.array(forKey: "deletedTasks") as? [String] {
            // successfully found the saved data!
            deletedTasks = deletedTaskData
        } else {
            // No data saved (first time only, probably!
            defaults.set([String](), forKey: "deletedTasks")
        }
        if let completedData = defaults.array(forKey: "completed") as? [Bool] {
            // successfully found the saved data!
            completed = completedData
        } else {
            // No data saved (first time only, probably!
            defaults.set([Bool](), forKey: "completed")
        }
        //check this
        points = defaults.integer(forKey: "points")
        completedTasks = defaults.integer(forKey: "completedTasks")
//        defaults.set(points, forKey: "points")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Populate tasks with data in UserDefaults
        if let taskData = defaults.array(forKey: "tasks") as? [String] {
            // successfully found the saved data!
            tasks = taskData
        }
        //Populate tasks with data in UserDefaults
        if let completedData = defaults.array(forKey: "completed") as? [Bool] {
            // successfully found the saved data!
            completed = completedData
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCellIdentifier", for: indexPath)
        
        //downcasting
        if let cellWithOtherName = cell as? InitialTableViewCell {
            //setup cell and pass information
            cellWithOtherName.taskCellLabel.text = tasks[indexPath.row]
            cellWithOtherName.isComplete = completed[indexPath.row]
            cellWithOtherName.cellForRowAt = indexPath.row
            //For the checkmark
            if !cellWithOtherName.isComplete! {
                cellWithOtherName.completeTaskButton.setImage(UIImage(systemName: "square"), for: .normal)
            } else {
                cellWithOtherName.completeTaskButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            }
            return cellWithOtherName
        }
        
        return cell
    }
    
    // Adding in the swipe to delete feature
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //add to deleted tasks array
            deletedTasks.append(tasks[indexPath.row])
            
            //delete item from tasks array
            tasks.remove(at: indexPath.row)
            completed.remove(at: indexPath.row)
            
            //update user defaults here
            defaults.set(tasks, forKey: "tasks")
            defaults.set(completed, forKey: "completed")
            defaults.set(deletedTasks, forKey: "deletedTasks")
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }    
    }
}
