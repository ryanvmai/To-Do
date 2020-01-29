//
//  EditTaskViewController.swift
//  To Do
//
//  Created by Ryan Mai on 1/17/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import UIKit
import Foundation

class EditTaskViewController: UIViewController {
    //outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var prioritySwitch: UISwitch!
    
    //UserDefaults setup
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Button Pressed
    @IBAction func doneButtonPressed(_ sender: Any) {
        //if the task name was not entered by the user
        if taskNameTextField.text == nil || taskNameTextField.text == "" {
            //NOT WORKING, NOT SURE WHY
            //Intended to dismiss the VC and not load any of the data if the user does not input a task name in the text field
            navigationController?.popViewController(animated: true)
        }
        
        //creating variables
        var tasks: [String] = []
        var completed: [Bool] = []
        var priority: [Bool] = []
        var notes: [String] = []
        
        //populating data from UserDefaults
        if let taskData = defaults.array(forKey: "tasks") as? [String] {
            // successfully found the saved data!
            tasks = taskData
        }
        if let completedData = defaults.array(forKey: "completed") as? [Bool] {
            completed = completedData
        }
        if let priorityData = defaults.array(forKey: "priority") as? [Bool] {
            priority = priorityData
        }
        if let notesData = defaults.array(forKey: "notes") as? [String] {
            notes = notesData
        }
        
        //appending arrays with user inputed information
        tasks.append(taskNameTextField.text!)
        completed.append(false) //creating task completed = false NOT completed
        if notesTextView.text == nil || notesTextView.text == "" || notesTextView.text == "Type any notes here" {
            notes.append("")
        } else {
            notes.append(notesTextView.text!)
        }
        priority.append(prioritySwitch.isOn)
        
        //loaded data into defaults
        defaults.set(tasks, forKey: "tasks")
        defaults.set(completed, forKey: "completed")
        defaults.set(notes, forKey: "notes")
        defaults.set(priority, forKey: "priority")
        
        //DR.Z helped me here: Updating the information in the InitialTableViewController
        if let tableVC = navigationController?.viewControllers.first as? InitialTableViewController {
            tableVC.tasks = tasks
            tableVC.completed = completed
            tableVC.notes = notes
            tableVC.priority = priority
            tableVC.tableView.reloadData()
        }
        navigationController?.popViewController(animated: true)
    }
}
