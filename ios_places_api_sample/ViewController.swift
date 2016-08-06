//
//  ViewController.swift
//  ios_places_api_sample
//
//  Created by Busra Deniz on 28/07/2016.
//  Copyright © 2016 Busra Deniz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        LocationManager.sharedInstance.initializeLocationManager();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

