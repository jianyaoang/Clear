//
//  ToDoItem.swift
//  Clear-Swift
//
//  Created by VLT Labs on 8/4/15.
//  Copyright (c) 2015 JayAng. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    
    
    var descriptionOfTask: String //details of task
    var completed: Bool //status of task
    
    init(descriptionOfTask: String) {
        
        self.descriptionOfTask = descriptionOfTask
        self.completed = false
    }
   
}
