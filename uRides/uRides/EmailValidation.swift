//
//  EmailValidation.swift
//  uRides
//
//  Created by Colin Targonski on 12/24/15.
//  Copyright © 2015 uRides Corporation. All rights reserved.
//

import Foundation
import UIKit

class Emailvalidation: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmTextField: UITextField!
    @IBOutlet weak var invalidEmailLabel: UILabel!
    
    
    
    // MARK: Actions
    @IBAction func validateEmail(sender: AnyObject) {
        let email = sender as? String
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let result = emailTest.evaluateWithObject(email)
        
        if (!result)
        {
            // display error message
            invalidEmailLabel.hidden = false
        }
        else
        {
            invalidEmailLabel.hidden = true
        }
        
    }

    @IBAction func validEmail(sender: AnyObject) {
        invalidEmailLabel.hidden = true
    }
    
}
