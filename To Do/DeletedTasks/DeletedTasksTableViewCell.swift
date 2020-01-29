//
//  DeletedTasksTableViewCell.swift
//  To Do
//
//  Created by Ryan Mai on 1/28/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import UIKit

class DeletedTasksTableViewCell: UITableViewCell {

    @IBOutlet weak var deletedTasksLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
