//
//  LocationManager.swift
//  ios_places_api_sample
//
//  Created by Busra Deniz on 01/08/2016.
//  Copyright © 2016 Busra Deniz. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager : NSObject , CLLocationManagerDelegate {
    
     private var latitude: CLLocationDegrees = 0.0
     private var longitude: CLLocationDegrees = 0.0

    class var sharedInstance: LocationManager {
        
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: LocationManager? = nil
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = LocationManager()
        }
        return Static.instance!
    }
    

    func initializeLocationManager() -> Void {
        let locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }

    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocationCoordinate2D = manager.location!.coordinate
        self.latitude = location.latitude;
        self.longitude = location.longitude;
        print("Location :  = \(location.latitude) , \(location.longitude)")
    }
    
    func getLocation() -> (CLLocationDegrees, CLLocationDegrees){
        return (self.latitude, self.longitude);
    }
    
}
