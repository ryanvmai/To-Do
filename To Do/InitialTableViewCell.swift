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
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var taskCellLabel: UILabel!
    @IBOutlet weak var completeTaskButton: UIButton!
    
    var isComplete: Bool? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state

    }

    @IBAction func completeTaskPressed(_ sender: Any) {
        //to create the strike-out, taken from https://stackoverflow.com/questions/13133014/uilabel-with-text-struck-through
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: taskCellLabel.text!)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))

        //changing the button
        if isComplete! {
            isComplete = false
            //uncheck the thing
            print("VIEW CELL")
            completeTaskButton.setImage(UIImage(systemName: "square"), for: .normal)
            //remove strike out NEED TO DO
            //change the image
        } else {
            isComplete = true
            //Strikes out the text
            //taskCellLabel.attributedText = attributeString
            //change the image
            print("VIEW CELL")
            completeTaskButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        }
    }
    
}
