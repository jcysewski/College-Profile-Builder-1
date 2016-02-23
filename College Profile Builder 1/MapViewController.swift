//
//  MapViewController.swift
//  College Profile Builder 1
//
//  Created by jcysewski on 2/11/16.
//  Copyright © 2016 jcysewski. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate
{
    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var myTextField: UITextField!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        myLocationManager.delegate = self
        myLocationManager.requestAlwaysAuthorization()
        myLocationManager.startUpdatingLocation()
        
        myMapView.delegate = self
        myMapView.showsUserLocation = true
        myMapView.userLocation.title = "My Location"
        
        addPinAnnotation()
    }
    @IBAction func searchButtonTapped(sender: AnyObject)
    {
        geoCodeLocation(myTextField.text!)
        myTextField.resignFirstResponder() //closes keyboard
    }
    func displayMap(MyPlaceMark: CLPlacemark) //ClPlaceMark represents placemark data for a geographic location
    {
        let myLocation = MyPlaceMark
        let mySpan = MKCoordinateSpanMake(1.0, 1.0)
        let myRegion = MKCoordinateRegionMake((myLocation.location?.coordinate)!, mySpan)
        
        myMapView.setRegion(myRegion, animated: true)
        
        let myPin = MKPointAnnotation()
        myPin.coordinate = (myLocation.location?.coordinate)!
        myPin.title = MyPlaceMark.name
        
        myMapView.addAnnotation(myPin)
        myTextField.text = MyPlaceMark.name
    }
    
    func geoCodeLocation(mySearch: String)
    {
        //Cl GeoCoder provides services for convirting between a coordinate and the user friendly representation
        let myGeoCode = CLGeocoder()
        
        myGeoCode.geocodeAddressString(mySearch)
            { (placemarks, error) -> Void in
                if error != nil
                {
                    print("error")
                }
                else
                {
                    self.displayMap((placemarks?.first)!)
                }
        }
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////
    
    let myLocationManager = CLLocationManager()
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        print(myLocationManager.location)
    }
    
    func addPinAnnotation()
    {
        let myCoordinate = CLLocationCoordinate2DMake(42.155275, -88.136782)
        let myAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = myCoordinate
        myAnnotation.title = "Catlow"
        myAnnotation.subtitle = "Theater"
        myMapView.addAnnotation(myAnnotation)
        
        setCenterOfMap(myCoordinate) //sets on the pin
        //setCenterOfMap((myLocationManager.location?.coordinate)!) //sets on location
    }
    
    func setCenterOfMap(Location: CLLocationCoordinate2D)
    {
        let mySpan = MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007)
        let myRegion = MKCoordinateRegion(center: Location, span: mySpan)
        myMapView.setRegion(myRegion, animated: true)
    }



}
