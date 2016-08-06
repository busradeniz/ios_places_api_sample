//
//  AutoCompleteViewController.swift
//  ios_places_api_sample
//
//  Created by Busra Deniz on 01/08/2016.
//  Copyright © 2016 Busra Deniz. All rights reserved.
//

import UIKit
import GooglePlaces


class AutoCompleteViewController: UIViewController , GMSAutocompleteResultsViewControllerDelegate{
    
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self;
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        let subView = UIView(frame: CGRectMake(0, 75, self.view.frame.size.width, 60.0))
        
        subView.addSubview((searchController?.searchBar)!)
        self.view.addSubview(subView)
        searchController?.searchBar.sizeToFit()
        searchController?.hidesNavigationBarDuringPresentation = false
        
        self.definesPresentationContext = true
    }
    
    
    @IBAction func btnBackAction(sender : UIButton){
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
   
    func resultsController(resultsController: GMSAutocompleteResultsViewController, didAutocompleteWithPlace place: GMSPlace) {
        searchController?.active = false
        print("Place name: ", place.name)
        print("Place address: ", place.formattedAddress)

    }
    
    func resultsController(resultsController: GMSAutocompleteResultsViewController,
                           didFailAutocompleteWithError error: NSError){
        print("Error: ", error.description)
    }
    
    func didRequestAutocompletePredictionsForResultsController(resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictionsForResultsController(resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

}

