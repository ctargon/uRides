//
//  LogInView.swift
//  uRides
//
//  Created by Colin Targonski on 12/24/15.
//  Copyright © 2015 uRides Corporation. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LogInView: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var emailEntryTextField: UITextField!
    @IBOutlet weak var passwordEntryField: UITextField!
    @IBOutlet weak var invalidMessageLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var invalidUserLabel: UILabel!
    
    
    
    var failed: Bool = true
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailEntryTextField.delegate = self
        passwordEntryField.delegate = self
        
        //Creates a gesutre for swiping down and adds it to gesture recognizer
        
        let swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "dismissKeyboard")
        swipe.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipe)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard");
        self.view.addGestureRecognizer(tap)
        self.logInButton.enabled = true
        
    }
    
    @IBAction func emailCheck2(sender: AnyObject) {
        invalidMessageLabel.hidden = true
    }
    
    // MARK: Actions
    @IBAction func emailValidCheck(sender: AnyObject) {
        //let email = sender as? String
        let email = emailEntryTextField.text
        
        func isValidEmail(email:String) -> Bool {
            // println("validate calendar: \(testStr)")
            let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluateWithObject(email)
        }
        
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let result = emailTest.evaluateWithObject(email)
        
        if (result)
        {
            // display error message
            invalidMessageLabel.hidden = false
        }
        else
        {
            invalidMessageLabel.hidden = true
        }
    }
    
    @IBAction func logInbut(sender: AnyObject) {
        let ref = Firebase(url: "https://crackling-fire-4869.firebaseio.com/")
        ref.authUser(emailEntryTextField.text, password: passwordEntryField.text,
            withCompletionBlock: { error, authData in
                if error != nil {
                    // There was an error logging in to this account
                    print("Error logging in")
                } else {
                    print("Success logging in")
                    self.performSegueWithIdentifier("showMap", sender: sender)
                }
        })
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //Uses the added gesutrue of swipe down in order to close keyboard and then makes nav bar reappear
    func dismissKeyboardSwipeDown() {
        self.emailEntryTextField.resignFirstResponder()
        self.passwordEntryField.resignFirstResponder()
    
        //self.navigationController?.navigationBarHidden = false
    
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
    
//    func textFieldDidEndEditing(textField: UITextField) {
//        
//        //emailEntryTextField.layoutIfNeeded()
//        
//        if ((emailEntryTextField.text?.isEmpty == false) && (passwordEntryField.text?.isEmpty == false))
//        {
//            if (invalidMessageLabel.hidden == true)
//            {
//            }
//        }
//        else
//        {
//            self.logInButton.enabled = false
//        }
//    }
    
    
    
    
}