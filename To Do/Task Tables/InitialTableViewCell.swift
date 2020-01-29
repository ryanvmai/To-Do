//
//  InitialTableViewCell.swift
//  To Do
//
//  Created by Ryan Mai on 1/22/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import UIKit
import Foundation

class InitialTableViewCell: UITableViewCell {
    // UserDefaults set up
    let defaults = UserDefaults.standard
    
    //Outlets for the cells
    @IBOutlet weak var taskCellLabel: UILabel!
    @IBOutlet weak var notesCellLabel: UILabel!
    @IBOutlet weak var completeTaskButton: UIButton!
    @IBOutlet weak var priorityButton: UIButton!
    
    //Variables that get populated by UserDefaults
    var isComplete: Bool? = nil
    var completed: [Bool] = []
    var cellForRowAt: Int = 0
    var points: Int = 0
    var tasksCompleted: Int = 0
   // var priority: [Bool] = []
    
    //Standard Code from Apple
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    @objc func infoPressed(_ sender: Any) {
        //sender.tag to get index
    }
    
    //Gets called when the complete button is pressed
    @IBAction func completeTaskPressed(_ sender: Any) {
        //Populates completed array from UserDefaults
        if let completedData = defaults.array(forKey: "completed") as? [Bool] {
            // successfully found the saved data!
            completed = completedData
        }
        points = defaults.integer(forKey: "points")
        tasksCompleted = defaults.integer(forKey: "tasksCompleted")
        
        //to create the strike-out, taken from https://stackoverflow.com/questions/13133014/uilabel-with-text-struck-through
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: taskCellLabel.text!)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))

        //changing the button
        if completed[cellForRowAt] {
            //Unchecking the button
            completed[cellForRowAt] = false
            defaults.set(completed, forKey: "completed")
            points -= 100
            defaults.set(points, forKey: "points")
            tasksCompleted -= 1
            defaults.set(tasksCompleted, forKey: "tasksCompleted")
            //uncheck the box, change image to square
            completeTaskButton.setImage(UIImage(systemName: "square"), for: .normal)
        } else {
            //Checking the button
            completed[cellForRowAt] = true
            defaults.set(completed, forKey: "completed")
            points += 100
            defaults.set(points, forKey: "points")
            tasksCompleted += 1
            print("From cell: \(defaults.integer(forKey: "tasksCompleted"))")
            defaults.set(tasksCompleted, forKey: "tasksCompleted")
            //Strikes out the text
            //taskCellLabel.attributedText = attributeString
            //change the image to check
            completeTaskButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        }
    }
    
}
