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

    override func viewDidLoad() {
        super.viewDidLoad()
        //UserDefaults - populate data
        if let deletedTasksData = defaults.array(forKey: "deletedTasks") as? [String] {
            deletedTasks = deletedTasksData
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //populate data
         if let deletedTasksData = defaults.array(forKey: "deletedTasks") as? [String] {
                   deletedTasks = deletedTasksData
        }
        
        // FOR TESTING ONLY - remember to delete
        for tasks in deletedTasks {
            print(tasks)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return number of rows
        return deletedTasks.count
    }

    //Configure the cell here
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCellIdentifier", for: indexPath)

        // Downcasting
        if let cellWithOtherName = cell as? DeletedTasksTableViewCell {
            //set up cell and pass information
            cellWithOtherName.deletedTasksLabel.text = deletedTasks[indexPath.row]
            return cellWithOtherName
        }

        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            deletedTasks.remove(at: indexPath.row)
            defaults.set(deletedTasks, forKey: "deletedTasks")
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }    
    }
}
