//
//  EditName.swift
//  uRides
//
//  Created by Colin Targonski on 4/18/16.
//  Copyright © 2016 uRides Corporation. All rights reserved.
//

import Foundation

import SkyFloatingLabelTextField

class EditName: UIViewController {
    
    // Mark: Properties

    
    // Mark: Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstName = SkyFloatingLabelTextField(frame: CGRectMake(80, 225, 200, 45))
        firstName.placeholder = "First"
        firstName.title = "Your first name"
        self.view.addSubview(firstName)
        
        let lastName = SkyFloatingLabelTextField(frame: CGRectMake(80, 280, 200, 45))
        lastName.placeholder = "Last"
        lastName.title = "Your last name"
        self.view.addSubview(lastName)
    }
    
}

