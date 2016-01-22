//
//  DetailViewController.swift
//  College Profile Builder 1
//
//  Created by jcysewski on 1/21/16.
//  Copyright © 2016 jcysewski. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfPeopleTextField: UITextField!
    
    var college : CollegeClass!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextField.text! = college.name
        locationTextField.text! = college.location
        numberOfPeopleTextField.text! = String(college.numberOfStudents)
        myImageView.image = college.picture
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(numberOfPeopleTextField.text!)!
        
    }

}
