//
//  PaymentViewController.swift
//  uRides
//
//  Created by Colin Targonski on 12/25/15.
//  Copyright © 2015 uRides Corporation. All rights reserved.
//

import Foundation

class PaymentViewController: UIViewController/*, STPViewDelegate*/ {
    
    @IBOutlet var saveButton: UIButton!
    
    //var stripeView: STPView = STPView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //stripeView = STPView(frame: CGRectMake(15, 20, 290, 55), andKey: "pk_test_35yTvl2PyJ6mN7k52KKkdd4r")
        
        //stripeView.delegate = self
        //view.addSubview(stripeView)
        saveButton.enabled = false
    }
    
}