//
//  DetailViewController.swift
//  College Profile Builder 1
//
//  Created by jcysewski on 1/21/16.
//  Copyright © 2016 jcysewski. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfPeopleTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    
    
    let myImagePicker = UIImagePickerController()
    var myPhotos: [UIImage] = [] // empty arrays of UIImages
    var counter = 0
    
    var college : CollegeClass!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextField.text! = college.name
        locationTextField.text! = college.location
        numberOfPeopleTextField.text! = String(college.numberOfStudents)
        myImageView.image = college.picture
        urlTextField.text! = college.webpage
        
        myImagePicker.delegate = self
        myImagePicker.allowsEditing = true
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(numberOfPeopleTextField.text!)!
        college.webpage = urlTextField.text!
        
    }
    @IBAction func webpageButtonTapped(sender: AnyObject)
    {
        let myURL = NSURL(string: "\(college.webpage)")
        let svc = SFSafariViewController(URL: myURL!)
        svc.delegate = self
        presentViewController(svc, animated: true, completion: nil)
    }
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func changePhotoButtonTapped(sender: AnyObject)
    {
        print("tapped")
        let mySheet = UIAlertController(title: "add from...", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        mySheet.addAction(UIAlertAction(title: "Photo Library", style: .Default, handler:
            { (libraryAction) -> Void in
                self.myImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.presentViewController(self.myImagePicker, animated: true, completion: nil)
        }))
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            mySheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler:
                { (cameraAction) -> Void in
                    self.myImagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                    self.presentViewController(self.myImagePicker, animated: true, completion: nil)
            }))
        }
        presentViewController(mySheet, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        myImagePicker.dismissViewControllerAnimated(true)
            { () -> Void in
                self.myImageView.image = (info[UIImagePickerControllerEditedImage] as! UIImage)
            }

    }



}
















