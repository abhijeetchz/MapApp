//
//  ViewController.swift
//  MapApp
//
//  Created by Abhijeet Chaudhary on 08/03/16.
//  Copyright © 2016 Abhijeet Chaudhary. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    

    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var btnLocation: UIButton!
    
    
    let locationMgr = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       locationMgr.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnLocationACT(sender: UIButton) {
        
        locationMgr.requestWhenInUseAuthorization()
        locationMgr.desiredAccuracy = kCLLocationAccuracyBest
        locationMgr.startUpdatingLocation()
        
    }

    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        let center = CLLocationCoordinate2DMake(location!.coordinate.latitude, location!.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        
        MapView.addAnnotation(annotation)
        MapView.setRegion(region, animated: true)
        locationMgr.stopUpdatingLocation()
        
    }
    
    
    
    
}

