//
//  StudentCheck.swift
//  uRides
//
//  Created by Colin Targonski on 12/23/15.
//  Copyright © 2015 uRides Corporation. All rights reserved.
//

import Foundation

import UIKit

class StudentCheck: UIViewController {
    
    // Mark: Properties
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBOutlet weak var schoolSearchBar: UISearchBar!
    @IBOutlet weak var firstNameTextBar: UITextField!
    @IBOutlet weak var lastNameTextBar: UITextField!
    @IBOutlet weak var studentIdTextBar: UITextField!
    
    // Mark: Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // parse test
        //let testObject = PFObject(className: "TestObject")
        //testObject["driver"] = "me!!!"
        ///testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
        //    print("Object has been saved.")
        }
    
    }
    
    // dismiss keyboard with return button
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }


