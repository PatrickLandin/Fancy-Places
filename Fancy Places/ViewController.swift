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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        var latitude : CLLocationDegrees = 47.863475
        var longitude : CLLocationDegrees = -122.208951
        
        var latScreenDelta : CLLocationDegrees = 0.01
        var longScreenDelta : CLLocationDegrees = 0.01
        
        var span : MKCoordinateSpan = MKCoordinateSpanMake(latScreenDelta, longScreenDelta)
        var location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Fancy House Thing!"
        
        annotation.subtitle = "2 Christmas trees and 6 dogs"
        
        mapView.addAnnotation(annotation)
        
        var lpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        lpgr.minimumPressDuration = 2.0;
        
        mapView.addGestureRecognizer(lpgr)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

