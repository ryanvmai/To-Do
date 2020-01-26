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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
}
