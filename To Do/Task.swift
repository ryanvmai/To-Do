//
//  Task.swift
//  To Do
//
//  Created by Ryan Mai on 1/18/20.
//  Copyright © 2020 Ryan Mai. All rights reserved.
//

import Foundation
import UIKit

class Task {
    var name: String
    var completed: Bool
    var notes: String
    var priority: Bool
    
    init(name: String, completed: Bool, notes: String, priority: Bool) {
        self.name = name
        self.completed = completed
        self.notes = notes
        self.priority = priority
    }
    
    func changeName(newName: String) {
        name = newName
    }
    
    func changeCompleted(newCompleted: Bool) {
        completed = newCompleted
    }
    
    func changeNotes(newNotes: String) {
        notes = newNotes
    }
    
    func changePriority(newPriority: Bool) {
        priority = newPriority
    }
}
