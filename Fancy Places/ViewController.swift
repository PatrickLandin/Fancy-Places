//
//  ViewController.swift
//  Fancy Places
//
//  Created by Patrick Landin on 12/19/14.
//  Copyright (c) 2014 Patrick Landin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {


    @IBOutlet weak var mapView: MKMapView!
    
    var manager : CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Core Location:
        
        self.manager.delegate = self
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
        
        
        // Map Data:
    
        var latitude : CLLocationDegrees = 47.863475
        var longitude : CLLocationDegrees = -122.208951
        
        var latScreenDelta : CLLocationDegrees = 0.015
        var longScreenDelta : CLLocationDegrees = 0.015
        
        var span : MKCoordinateSpan = MKCoordinateSpanMake(latScreenDelta, longScreenDelta)
        var location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        // set location starting location on map
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Fancy House Thing!"
        annotation.subtitle = "2 Christmas trees and 6 dogs"
        mapView.addAnnotation(annotation)
        
        // set starting annotation to map
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 2.0;
        
        mapView.addGestureRecognizer(uilpgr)
        
        
    }
    
    
    func action(gestureRecognizer : UIGestureRecognizer) {
        
        var touchPoint = gestureRecognizer.locationInView(self.mapView)
        var newCoordinate : CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        
        var newAnnotation = MKPointAnnotation()
        newAnnotation.coordinate = newCoordinate
        newAnnotation.title = "New Point"
        newAnnotation.subtitle = "One day I'll go here"
        mapView.addAnnotation(newAnnotation)
        
        // allowed for user to create annotation using 2 sec long press
        
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("locations = \(locations)")
    }
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print("error")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

