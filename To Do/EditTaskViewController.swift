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
    
    //UserDefaults setup
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Button Pressed
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        if taskNameTextField.text == nil || taskNameTextField.text == "" {
                    //this doesnt work... it is still adding blank things to the table view
                    dismiss(animated: true, completion: nil)
                }
                var tasks: [String] = []
                var completed: [Bool] = []
                if let taskData = defaults.array(forKey: "tasks") as? [String] {
                    // successfully found the saved data!
                    tasks = taskData
                }
                if let completedData = defaults.array(forKey: "completed") as? [Bool] {
                    completed = completedData
                }
                //appending arrays
                tasks.append(taskNameTextField.text!)
                completed.append(false) //creating task completed = false NOT completed
                //loaded data into defaults
                defaults.set(tasks, forKey: "tasks")
                defaults.set(completed, forKey: "completed")
                
        //        print(navigationController?.viewControllers.first)
        //        print(type(of: navigationController?.viewControllers.first))
                
                //DR.Z
                if let tableVC = navigationController?.viewControllers.first as? InitialTableViewController {
                    print("dfgsdfg")
                    tableVC.tasks = tasks
                    tableVC.completed = completed
                    tableVC.tableView.reloadData()
                }
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
//    @IBAction func donePressed(_ sender: Any) {
//        if taskNameTextField.text == nil || taskNameTextField.text == "" {
//            //this doesnt work... it is still adding blank things to the table view
//            dismiss(animated: true, completion: nil)
//        }
//        var tasks: [String] = []
//        var completed: [Bool] = []
//        if let taskData = defaults.array(forKey: "tasks") as? [String] {
//            // successfully found the saved data!
//            tasks = taskData
//        }
//        if let completedData = defaults.array(forKey: "completed") as? [Bool] {
//            completed = completedData
//        }
//        //appending arrays
//        tasks.append(taskNameTextField.text!)
//        completed.append(false) //creating task completed = false NOT completed
//        //loaded data into defaults
//        defaults.set(tasks, forKey: "tasks")
//        defaults.set(completed, forKey: "completed")
//
////        print(navigationController?.viewControllers.first)
////        print(type(of: navigationController?.viewControllers.first))
//
//        //DR.Z
//        if let tableVC = navigationController?.viewControllers.first as? InitialTableViewController {
//            print("dfgsdfg")
//            tableVC.tasks = tasks
//            tableVC.completed = completed
//            tableVC.tableView.reloadData()
//        }
//        dismiss(animated: true, completion: nil)
//    }
    
    //THIS DID NOT WORK
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destinationvc = segue.destination as? InitialTableViewController {
//            if let taskData = defaults.array(forKey: "tasks") as? [String] {
//                // successfully found the saved data!
//                destinationvc.tasks = taskData
//            }
//
//
//            destinationvc.tableView.reloadData()
//        }
//    }
}
