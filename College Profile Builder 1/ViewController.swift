//
//  ViewController.swift
//  College Profile Builder 1
//
//  Created by jcysewski on 1/20/16.
//  Copyright © 2016 jcysewski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    var arrayOfColleges :[CollegeClass] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        
        //arrayOfColleges.append(CollegeClass(Name: "Northwestern", Location: "Evanston, IL", NumberOfStudents: 1234, Picture: UIImage(named: "Northwestern")!))
    }

    @IBAction func addButtonTapped(sender: AnyObject)
    {
        
    }

    @IBAction func editButtonTapped(sender: AnyObject)
    {
    }
    //this function creates a cell that wil store your data on your table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = arrayOfColleges[indexPath.row].name
        myTableViewCell.detailTextLabel?.text = arrayOfColleges[indexPath.row].location
        return myTableViewCell
    }
    
    //sets the number of rows in the table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayOfColleges.count
    }
    //alows you to delete rows from the table view
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            arrayOfColleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true // allows you to move rows
    }
    
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = arrayOfColleges[sourceIndexPath.row]
        arrayOfColleges.removeAtIndex(sourceIndexPath.row)
        arrayOfColleges.insert(college, atIndex: destinationIndexPath.row)
    }
}




































