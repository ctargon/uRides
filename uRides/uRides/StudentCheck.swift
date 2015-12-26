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
        
        //Hide the nav bar anytime the keyboard appears
        navigationController?.hidesBarsWhenKeyboardAppears = true
      
        //Creates a gesutre for swiping down and adds it to gesture recognizer
        let swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "dismissKeyboardSwipeDown")
        swipe.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipe)
    }
    
    //Uses the added gesutrue of swipe down in order to close keyboard and then makes nav bar reappear
    func dismissKeyboardSwipeDown() {
        self.schoolSearchBar.resignFirstResponder()
        self.firstNameTextBar.resignFirstResponder()
        self.lastNameTextBar.resignFirstResponder()
        self.studentIdTextBar.resignFirstResponder()
        
        self.navigationController?.navigationBarHidden = false
    }
}
