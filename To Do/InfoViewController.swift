//
//  InfoViewController.swift
//  To Do
//
//  Created by Ryan Mai on 1/24/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    let defaults = UserDefaults.standard
    var points: Int = 0
    var completedTasks: Int = 0
    var deletedTasks: [String] = []
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        points = defaults.integer(forKey: "points")
        completedTasks = defaults.integer(forKey: "completedTasks")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        points = defaults.integer(forKey: "points")
        completedTasks = defaults.integer(forKey: "completedTasks")
        pointsLabel.text = String(points)
        print(completedTasks)
        
        //testing purposes only
        if let deletedTaskData = defaults.array(forKey: "deletedTasks") as? [String] {
            deletedTasks = deletedTaskData
        }
        for tasks in deletedTasks {
            print(tasks)
        }
    }
    
}
