//
//  SettingsView.swift
//  uRides
//
//  Created by Carter Kristek on 3/10/16.
//  Copyright © 2016 uRides Corporation. All rights reserved.
//

import Foundation
import UIKit

class SettingsView: UIViewController{
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushDriverMode(sender: AnyObject) {
         self.performSegueWithIdentifier("showDriverMap", sender:sender)
    }
    
    
    
}
