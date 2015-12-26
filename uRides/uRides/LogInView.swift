//
//  LogInView.swift
//  uRides
//
//  Created by Colin Targonski on 12/24/15.
//  Copyright © 2015 uRides Corporation. All rights reserved.
//

import Foundation
import UIKit

class LogInView: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var emailEntryTextField: UITextField!
    @IBOutlet weak var passwordEntryField: UITextField!
    @IBOutlet weak var invalidMessagLabel: UILabel!
    
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
            invalidMessagLabel.hidden = false
        }
        else
        {
            invalidMessagLabel.hidden = true
        }
    }
    
    @IBAction func emailCheck2(sender: AnyObject) {
        invalidMessagLabel.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hide the nav bar anytime the keyboard appears
        navigationController?.hidesBarsWhenKeyboardAppears = true
        
        //Creates a gesutre for swiping down and adds it to gesture recognizer
        let swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "dismissKeyboardSwipeDown")
        swipe.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipe)
    }
    
    //Uses the added gesutrue of swipe down in order to close keyboard and then makes nav bar reappear
    func dismissKeyboardSwipeDown() {
        self.emailEntryTextField.resignFirstResponder()
        self.passwordEntryField.resignFirstResponder()
    
        self.navigationController?.navigationBarHidden = false
    
    }
}