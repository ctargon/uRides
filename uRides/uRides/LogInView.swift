//
//  LogInView.swift
//  uRides
//
//  Created by Colin Targonski on 12/24/15.
//  Copyright © 2015 uRides Corporation. All rights reserved.
//

import Foundation
import UIKit

class LogInView: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var emailEntryTextField: UITextField!
    @IBOutlet weak var passwordEntryField: UITextField!
    @IBOutlet weak var invalidMessageLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var invalidUserLabel: UILabel!
    
    var failed: Bool = true
   
    // MARK: Actions
    @IBAction func emailValidCheck(sender: AnyObject) {
        //let email = sender as? String
        let email = emailEntryTextField.text
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let result = emailTest.evaluateWithObject(email)
        
        if (!result)
        {
            // display error message
            invalidMessageLabel.hidden = false
        }
        else
        {
            invalidMessageLabel.hidden = true
        }
    }
    
    @IBAction func emailCheck2(sender: AnyObject) {
        invalidMessageLabel.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailEntryTextField.delegate = self
        passwordEntryField.delegate = self
        
        //Hide the nav bar anytime the keyboard appears
        navigationController?.hidesBarsWhenKeyboardAppears = true
        
        //Creates a gesutre for swiping down and adds it to gesture recognizer
        
        let swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "dismissKeyboard")
        swipe.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipe)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func userTappedBackground(sender : AnyObject) {
        view.endEditing(true)
    }
    
    //Uses the added gesutrue of swipe down in order to close keyboard and then makes nav bar reappear
    func dismissKeyboardSwipeDown() {
        self.emailEntryTextField.resignFirstResponder()
        self.passwordEntryField.resignFirstResponder()
    
        self.navigationController?.navigationBarHidden = false
    
    }
    
    // uses return button to dismiss keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        //emailEntryTextField.layoutIfNeeded()
        
        invalidMessageLabel.hidden = true
        invalidUserLabel.hidden = true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        //emailEntryTextField.layoutIfNeeded()
        
        if ((emailEntryTextField.text?.isEmpty == false) && (passwordEntryField.text?.isEmpty == false))
        {
            if (invalidMessageLabel.hidden == true)
            {
                validateUser()
            }
        }
        else
        {
            self.logInButton.enabled = false
        }
    }
    
    @IBAction func logInButtonPressed(sender: AnyObject) {
        if (failed)
        {
            self.invalidUserLabel.hidden = false
        }
        else
        {
            self.invalidUserLabel.hidden = true
        }
    }
    
    func validateUser() {
        let userQuery = PFQuery(className: "uRidesUsers")
        userQuery.whereKey("email", equalTo: emailEntryTextField.text!)
        
        userQuery.getFirstObjectInBackgroundWithBlock {
            (object: PFObject?, error: NSError?) -> Void in
            if error != nil || object == nil {
                self.invalidUserLabel.hidden = false
                self.failed = true
                print("The getFirstObject request failed.")
            } else {
                
                self.failed = false
                
                if object!["password"].isEqual(self.passwordEntryField.text) {
                    self.logInButton.enabled = true
                }
                else {
                    self.invalidUserLabel.hidden = false
                }
                // The find succeeded.
                print("Successfully retrieved the object.")
            }
        }
    }
}