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
        
        arrayOfColleges.append(CollegeClass(Name: "Northwestern", Location: "Evanston, IL", NumberOfStudents: 1234, Picture: UIImage(named: "Northwestern")!, Webpage: "http://www.northwestern.edu"))
        arrayOfColleges.append(CollegeClass(Name: "Michigan State", Location: "East Lansing, MI", NumberOfStudents: 1234, Picture: UIImage(named: "Michigan State")!, Webpage: "https://msu.edu"))
        arrayOfColleges.append(CollegeClass(Name: "Wisconsin", Location: "Madison, WI", NumberOfStudents: 1234, Picture: UIImage(named: "Wisconsin")!, Webpage: "https://www.wisc.edu"))
        arrayOfColleges.append(CollegeClass(Name: "Iowa State", Location: "Ames, IA", NumberOfStudents: 1234, Picture: UIImage(named: "Iowa State")!, Webpage: "https://www.iastate.edu"))
        arrayOfColleges.append(CollegeClass(Name: "Colorado", Location: "Boulder, CO", NumberOfStudents: 1234, Picture: UIImage(named: "Colorado")!, Webpage: "http://www.colorado.edu"))
         arrayOfColleges.append(CollegeClass(Name: "Arizona State", Location: "Tempe, AZ", NumberOfStudents: 1234, Picture: UIImage(named: "ASU")!, Webpage: "http://www.asu.edu"))
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
                let websiteTextField = myAlert.textFields! [2] as UITextField
                self.arrayOfColleges.append(CollegeClass(Name: nameTextField.text!, Location: locationTextField.text!, Webpage: websiteTextField.text!))
                self.myTableView.reloadData()
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
        myAlert.addTextFieldWithConfigurationHandler
            { (locationTextField) -> Void in
                locationTextField.placeholder = "Add Website"
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailVC = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailVC.college = arrayOfColleges[selectedRow!] //detailVC.superhero(reciever) = superheros[selectedRow](quarterback)
    }
}



































