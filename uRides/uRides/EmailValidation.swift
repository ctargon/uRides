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
    @IBOutlet weak var confirmEmailErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    // MARK: Actions
    // checks for a valid email address shows message if invalid
    @IBAction func validateEmail(sender: AnyObject) {
        //let email = sender as? String
        let email = emailTextField.text 
        
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

    // hides the label if the text is being changed
    @IBAction func validEmail(sender: AnyObject) {
        invalidEmailLabel.hidden = true
    }
    
    // this function sets the warning label if the fields are not equal
    @IBAction func emailConfirmValidate(sender: AnyObject) {
        let email = emailTextField.text
        let confirmEmail = emailConfirmTextField.text
        
        if (email != confirmEmail)
        {
            confirmEmailErrorLabel.hidden = false
        }
        else
        {
            confirmEmailErrorLabel.hidden = true
        }
    }
    
    // this function hides the warning label during editing
    @IBAction func emailConfirmHelper(sender: AnyObject) {
        confirmEmailErrorLabel.hidden = true
    }
    
    // see if passwords match, display error if so
    @IBAction func passwordValidation(sender: AnyObject) {
        let pword = passwordTextField.text
        let confirmedPword = confirmPasswordTextField.text
        
        if (pword != confirmedPword)
        {
            passwordErrorLabel.hidden = false
        }
        else
        {
            passwordErrorLabel.hidden = true
        }
    }
    
    // during editing hide error message
    @IBAction func passwordValHelper(sender: AnyObject) {
        passwordErrorLabel.hidden = true
    }
    
}
