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
    let defaults = UserDefaults.standard
    var tasks: [String] = []
    var completed: [Bool] = []
    var points: Int = 0
    
    override func viewDidAppear(_ animated: Bool) {
        if let taskData = defaults.array(forKey: "tasks") as? [String] {
            // successfully found the saved data!
            tasks = taskData
        }
        if let completedData = defaults.array(forKey: "completed") as? [Bool] {
            // successfully found the saved data!
            completed = completedData
        }
    }
    
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
        if let completedData = defaults.array(forKey: "completed") as? [Bool] {
            // successfully found the saved data!
            completed = completedData
        } else {
            // No data saved (first time only, probably!
            defaults.set([Bool](), forKey: "completed")
        }
        
        //NEED TO FIX THIS
//        if let pointsData = defaults.array(forKey: "points") as? Int {
//            points = pointsData
//        } else {
//            defaults.set(Int(), forKey: "points")
//        }
        
        
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCellIdentifier", for: indexPath)
        
        //downcasting
        if let cellWithOtherName = cell as? InitialTableViewCell {
            cellWithOtherName.taskCellLabel.text = tasks[indexPath.row]
            cellWithOtherName.isComplete = completed[indexPath.row]
            if completed[indexPath.row] {
                cellWithOtherName.completeTaskButton.setImage(UIImage(systemName: "square"), for: .normal)
            } else {
                cellWithOtherName.completeTaskButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            }
            return cellWithOtherName
        }
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //delete item from tasks array
            tasks.remove(at: indexPath.row)
            completed.remove(at: indexPath.row)
            //update user defaults here
            defaults.set(tasks, forKey: "tasks")
            defaults.set(completed, forKey: "completed")
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }    
    }
}





/*
// Override to support rearranging the table view.
override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

} */


/*
// Override to support conditional rearranging of the table view.
override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
}
*/

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/

