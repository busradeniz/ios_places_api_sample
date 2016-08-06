//
//  PlacePickerViewController.swift
//  ios_places_api_sample
//
//  Created by Busra Deniz on 28/07/2016.
//  Copyright © 2016 Busra Deniz. All rights reserved.
//

import UIKit
import GooglePlacePicker
import CoreLocation

class PlacePickerViewController : UIViewController  {
    
    var placePicker: GMSPlacePicker?

    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblAddress: UILabel!


    @IBAction func btnSelectPlaceAction(sender: UIButton) {

        openPlacePickerView();
    }
    
    
    func openPlacePickerView() -> Void {
        
        let (latitude, longitude) = LocationManager.sharedInstance.getLocation();
        
        let northEast = CLLocationCoordinate2DMake(latitude + 0.001, longitude + 0.001)
        let southWest = CLLocationCoordinate2DMake(latitude - 0.001, longitude - 0.001)
        
        
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        placePicker = GMSPlacePicker(config: config)
        
        placePicker?.pickPlaceWithCallback({ (place: GMSPlace?, error: NSError?) -> Void in
            if let error = error {
                print("Place Picker error: \(error.localizedDescription)")
                return
            }
            
            if let selectedPlace = place {
                print("Place name : \(selectedPlace.name)  - place address : \(selectedPlace.formattedAddress)" );
                self.lblName.text = selectedPlace.name
                self.lblAddress.text = selectedPlace.formattedAddress!.componentsSeparatedByString(", ").joinWithSeparator("\n")
            }
        })

    }
    
    @IBAction func btnBackAction(sender : UIButton){
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    
}
