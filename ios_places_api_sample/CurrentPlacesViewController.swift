//
//  CurrentPlacesViewController.swift
//  ios_places_api_sample
//
//  Created by Busra Deniz on 01/08/2016.
//  Copyright © 2016 Busra Deniz. All rights reserved.
//

import UIKit
import GooglePlaces

class CurrentPlacesViewController: UIViewController {
    
    
    var placesClient: GMSPlacesClient?
    @IBOutlet var lblPlaces : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesClient = GMSPlacesClient.sharedClient()
        getCurrentPlace();
    }
    
    func getCurrentPlace() {
        placesClient = GMSPlacesClient.sharedClient();
        placesClient?.currentPlaceWithCallback({(placeLikelihoodList: GMSPlaceLikelihoodList?, error: NSError?) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let placeLikelihoodList = placeLikelihoodList {
                for place in placeLikelihoodList.likelihoods {
                   
                    let selectedPlace = place.place as GMSPlace;
                    print("Place Name : \(selectedPlace.name) - \(selectedPlace.formattedAddress)");
                    
                    self.lblPlaces.text = self.lblPlaces.text?.stringByAppendingString(selectedPlace.name + " \n ");
                    
                }
            }
        })
    }

    @IBAction func btnBackAction(sender : UIButton){
        self.navigationController?.popViewControllerAnimated(true);
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
}
