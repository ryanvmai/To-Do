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
    @IBOutlet weak var tasksCompletedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        points = defaults.integer(forKey: "points")
        completedTasks = defaults.integer(forKey: "tasksCompleted")
        
        pointsLabel.text = String(points)
        tasksCompletedLabel.text = String(completedTasks)
        print("From UserDefaults: \(defaults.integer(forKey: "tasksCompleted"))")
        print("completedTasks: \(completedTasks)")
    }
    
    //Resets the points and tasks completed
    @IBAction func resetStatsPressed(_ sender: Any) {
        points = 0
        completedTasks = 0
        defaults.set(points, forKey: "points")
        defaults.set(completedTasks, forKey: "tasksCompleted")
        
        pointsLabel.text = String(0)
        tasksCompletedLabel.text = String(0)
    }
    
}
