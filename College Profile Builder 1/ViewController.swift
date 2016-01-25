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
        
        arrayOfColleges.append(CollegeClass(Name: "Northwestern", Location: "Evanston, IL", NumberOfStudents: 1234, Picture: UIImage(named: "Northwestern")!))
        arrayOfColleges.append(CollegeClass(Name: "Michigan State", Location: "East Lansing, MI", NumberOfStudents: 1234, Picture: UIImage(named: "Michigan State")!))
        arrayOfColleges.append(CollegeClass(Name: "Wisconsin", Location: "Madison, WI", NumberOfStudents: 1234, Picture: UIImage(named: "Wisconsin")!))
        arrayOfColleges.append(CollegeClass(Name: "Iowa State", Location: "Ames, IA", NumberOfStudents: 1234, Picture: UIImage(named: "Iowa State")!))
    }

    @IBAction func addButtonTapped(sender: AnyObject)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default)
        { (addAction) -> Void in
                let nameTextField = myAlert.textFields![0] as UITextField
                let locationTextField = myAlert.textFields![1] as UITextField
                self.arrayOfColleges.append(CollegeClass(Name: nameTextField.text!, Location: locationTextField.text!))
        }
        
        myAlert.addAction(addAction)
        
        
        myAlert.addTextFieldWithConfigurationHandler
            { (nameTextField) -> Void in
                nameTextField.placeholder = "Add College Name"
        }
        myAlert.addTextFieldWithConfigurationHandler
            { (locationTextField) -> Void in
                locationTextField.placeholder = "Add Location"
        }
        
        
        
        self.presentViewController(myAlert, animated: true, completion: nil) //presents the alert view
    }

    @IBAction func editButtonTapped(sender: AnyObject)
    {
        myTableView.editing = !myTableView.editing
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




































