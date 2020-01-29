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
    var deletedTasksCompleted: [Bool] = []
    var completed: [Bool] = []
    var priority: [Bool] = []
    var points: Int = 0
    var completedTasks: Int = 0
    var notes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting up UserDefaults: checking for variables and populating them
        if let taskData = defaults.array(forKey: "tasks") as? [String] {
            // successfully found the saved data!
            tasks = taskData
        } else {
            // No data saved (first time only, probably!
            defaults.set([String](), forKey: "tasks")
        }
        if let notesData = defaults.array(forKey: "notes") as? [String] {
            notes = notesData
        } else {
            defaults.set([String](), forKey: "notes")
        }
        if let priorityData = defaults.array(forKey: "priority") as? [Bool] {
            priority = priorityData
        } else {
            defaults.set([Bool](), forKey: "priority")
        }
        if let deletedTaskCompletedData = defaults.array(forKey: "deletedCompleted") as? [Bool] {
            deletedTasksCompleted = deletedTaskCompletedData
        } else {
            defaults.set([Bool](), forKey: "deletedCompleted")
        }
        if let deletedTaskData = defaults.array(forKey: "deletedTasks") as? [String] {
            deletedTasks = deletedTaskData
        } else {
            defaults.set([String](), forKey: "deletedTasks")
        }
        if let completedData = defaults.array(forKey: "completed") as? [Bool] {
            completed = completedData
        } else {
            defaults.set([Bool](), forKey: "completed")
        }
        points = defaults.integer(forKey: "points")
        completedTasks = defaults.integer(forKey: "completedTasks")
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
        if let priorityData = defaults.array(forKey: "priority") as? [Bool] {
            priority = priorityData
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
            cellWithOtherName.notesCellLabel.text = notes[indexPath.row]
            if priority[indexPath.row] {
                cellWithOtherName.priorityButton.setImage(UIImage(systemName: "flag.fill"), for: .normal)
            } else {
                //remove the image here (only need when you add in the editing feature)
            }
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
            
            //Updated array from UserDefaults
            if let deletedTasksData = defaults.array(forKey: "deletedTasks") as? [String] {
                deletedTasks = deletedTasksData
            }
            if let deletedTasksCompletedData = defaults.array(forKey: "deletedCompleted") as? [Bool] {
                deletedTasksCompleted = deletedTasksCompletedData
            }
            
            //add to deleted tasks array
            deletedTasks.append(tasks[indexPath.row])
            deletedTasksCompleted.append(completed[indexPath.row])
            
            //delete item from tasks array
            tasks.remove(at: indexPath.row)
            notes.remove(at: indexPath.row)
            completed.remove(at: indexPath.row)
            priority.remove(at: indexPath.row)
            
            //update user defaults here
            defaults.set(deletedTasks, forKey: "deletedTasks")
            defaults.set(deletedTasksCompleted, forKey: "deletedCompleted")
            defaults.set(tasks, forKey: "tasks")
            defaults.set(notes, forKey: "notes")
            defaults.set(completed, forKey: "completed")
            defaults.set(priority, forKey: "priority")
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }    
    }
}
