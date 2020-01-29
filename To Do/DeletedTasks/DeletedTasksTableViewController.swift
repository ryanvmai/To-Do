//
//  DeletedTasksTableViewController.swift
//  To Do
//
//  Created by Ryan Mai on 1/28/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import UIKit
import Foundation

class DeletedTasksTableViewController: UITableViewController {
    //UserDefaults set up
    let defaults = UserDefaults.standard
    //Variables that will be matched with UserDefaults
    var deletedTasks: [String] = []
    var deletedTasksCompleted: [Bool] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //UserDefaults - populate data
        if let deletedTasksData = defaults.array(forKey: "deletedTasks") as? [String] {
            deletedTasks = deletedTasksData
        }
        if let deletedTasksCompletedData = defaults.array(forKey: "deletedCompleted") as? [Bool] {
            deletedTasksCompleted = deletedTasksCompletedData
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //populate data
         if let deletedTasksData = defaults.array(forKey: "deletedTasks") as? [String] {
                   deletedTasks = deletedTasksData
        }
        if let deletedTasksCompletedData = defaults.array(forKey: "deletedCompleted") as? [Bool] {
            deletedTasksCompleted = deletedTasksCompletedData
        }
        //Reload the data
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //set number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return number of rows
        return deletedTasks.count
    }

    //Configure the cell here
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myIdentifier", for: indexPath)

        // Downcasting
        if let cellWithOtherName = cell as? DeletedTasksTableViewCell {
            //set up cell and pass information
            cellWithOtherName.deletedTasksLabel.text = deletedTasks[indexPath.row]
            
            if deletedTasksCompleted[indexPath.row] {
                print("task completed")
                cellWithOtherName.completedLabel.text = "Completed"
            } else {
                print("Task not completed")
                cellWithOtherName.completedLabel.text = "Not Completed"
            }
            
            return cellWithOtherName
        }

        return cell
    }

    
    // Allowing swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //deleting from the arrau
            deletedTasks.remove(at: indexPath.row)
            deletedTasksCompleted.remove(at: indexPath.row)
            //setting UserDefaults
            defaults.set(deletedTasks, forKey: "deletedTasks")
            defaults.set(deletedTasksCompleted, forKey: "deletedCompleted")
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }    
    }
    
    //Clearing the entire table
    @IBAction func clearPressed(_ sender: Any) {
        deletedTasks.removeAll()
        deletedTasksCompleted.removeAll()
        print(deletedTasks.count)
        defaults.set(deletedTasks, forKey: "deletedTasks")
        defaults.set(deletedTasksCompleted, forKey: "deletedCompleted")
        print(defaults.array(forKey: "deletedTasks")!.count)
        tableView.reloadData()
    }
    
}
