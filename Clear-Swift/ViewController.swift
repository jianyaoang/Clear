//
//  ViewController.swift
//  Clear-Swift
//
//  Created by VLT Labs on 8/4/15.
//  Copyright (c) 2015 JayAng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var toDoTasks = [ToDoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatingToDoItems()
        configureTableView()
    }
    
    func configureTableView() {
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.rowHeight = 60.0;
        
    }

    func creatingToDoItems() {
        
        if toDoTasks.count > 0 {
            
            return
            
        } else {
            
            let toDoItem1 = ToDoItem(descriptionOfTask: "Pick up nephew from coding bootcamp")
            let toDoItem2 = ToDoItem(descriptionOfTask: "Cook dinner for family")
            let toDoItem3 = ToDoItem(descriptionOfTask: "Workout for 30 minutes")
            let toDoItem4 = ToDoItem(descriptionOfTask: "Pay monthly rent at ADIEW Management")
            let toDoItem5 = ToDoItem(descriptionOfTask: "Submit university application essays")
            let toDoItem6 = ToDoItem(descriptionOfTask: "Book wedding photo studio for this Saturday")
            let toDoItem7 = ToDoItem(descriptionOfTask: "Schedule appointment with Dr.Raj for yearly chekcup")
            let toDoItem8 = ToDoItem(descriptionOfTask: "Buy Ellie Goulding concert tickets")
            let toDoItem9 = ToDoItem(descriptionOfTask: "Practice cover songs on acoustic guitar")
            let toDoItem10 = ToDoItem(descriptionOfTask: "Get a haircut")
            let toDoItem11 = ToDoItem(descriptionOfTask: "Checkout resorts in Bali for Sam")
            let toDoItem12 = ToDoItem(descriptionOfTask: "Purchase new iPod Touch 6th Gen for Desmond")
            
            toDoTasks.append(toDoItem1)
            toDoTasks.append(toDoItem2)
            toDoTasks.append(toDoItem3)
            toDoTasks.append(toDoItem4)
            toDoTasks.append(toDoItem5)
            toDoTasks.append(toDoItem6)
            toDoTasks.append(toDoItem7)
            toDoTasks.append(toDoItem8)
            toDoTasks.append(toDoItem9)
            toDoTasks.append(toDoItem10)
            toDoTasks.append(toDoItem11)
            toDoTasks.append(toDoItem12)

        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoTasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoItemCell") as! UITableViewCell
        
        let toDoItem = toDoTasks[indexPath.row] as ToDoItem
        
        cell.textLabel?.text = toDoItem.descriptionOfTask
        
        return cell
        
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func applyGradientColorToGradient(indexPath: Int) -> UIColor {
        
        let tableViewItemCount = toDoTasks.count - 1
        let greenFloat = (CGFloat(indexPath) / CGFloat(tableViewItemCount)) * 0.8
        return UIColor(red: 1.0, green: greenFloat, blue: 0.0, alpha: 1)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.backgroundColor = applyGradientColorToGradient(indexPath.row)
        
    }
    
}


