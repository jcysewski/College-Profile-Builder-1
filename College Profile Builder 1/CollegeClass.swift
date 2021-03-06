//
//  CollegeClass.swift
//  College Profile Builder 1
//
//  Created by jcysewski on 1/21/16.
//  Copyright © 2016 jcysewski. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{
    var name = "" //these replace the arrays
    var location = ""
    var numberOfStudents = 0
    var picture = UIImage(named: "Default")
    var webpage = ""
    
    init(Name: String, Location: String, NumberOfStudents: Int, Picture: UIImage, Webpage: String) //convinence initializers makes objects of the SuperheroClass
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
        picture = Picture
        webpage = Webpage
    }
    
    init(Name: String, Location: String, Webpage: String) //convinence initializers makes objects of the SuperheroClass
    {
        super.init()
        name = Name
        location = Location
        webpage = Webpage
    }


}
