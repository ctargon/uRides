//
//  EmailValidation.swift
//  uRides
//
//  Created by Colin Targonski on 12/24/15.
//  Copyright © 2015 uRides Corporation. All rights reserved.
//

import Foundation
import UIKit

class Emailvalidation: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmTextField: UITextField!
    @IBOutlet weak var invalidEmailLabel: UILabel!
    @IBOutlet weak var confirmEmailErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var createUserButton: UIButton!
    
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
    
    // dismiss keyboard with return button
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        emailConfirmTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        //Hide the nav bar anytime the keyboard appears
        //navigationController?.hidesBarsWhenKeyboardAppears = true
        
        //Creates a gesutre for swiping down and adds it to gesture recognizer
        let swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "dismissKeyboardSwipeDown")
        swipe.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipe)
    }
    
    //Uses the added gesutrue of swipe down in order to close keyboard and then makes nav bar reappear
    func dismissKeyboardSwipeDown() {
        self.emailTextField.resignFirstResponder()
        self.emailConfirmTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.confirmPasswordTextField.resignFirstResponder()
        
        //self.navigationController?.navigationBarHidden = false
    }
    
    // enables the buttons if the text field is not empty
    func textFieldDidEndEditing(textField: UITextField) {
        if ((emailTextField.text?.isEmpty == false) && (emailConfirmTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false) && (confirmPasswordTextField.text?.isEmpty == false))
        {
            if (invalidEmailLabel.hidden == true && passwordErrorLabel.hidden == true)
            {
                self.createUserButton.enabled = true
            }
        }
        else
        {
            self.createUserButton.enabled = false
        }
    }
    
    // adds the users information if everything is valid
    @IBAction func submitUserInfo(sender: AnyObject) {
        
        // parse entry
        let userObject = PFObject(className: "uRidesUsers")
        userObject["password"] = passwordTextField.text
        userObject["email"] = emailTextField.text
        // test entry... needs updating. can also add first and last name here
        userObject["studentID"] = "C111111110"
        userObject["school"] = "Clemson"
                    
        userObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if (success)
            {
                print("User has been saved.")
            }
            else
            {
                // something went wrong
            }
        }
    
    }
}
