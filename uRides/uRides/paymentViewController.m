//
//  paymentMethodView.swift
//  uRides
//
//  Created by Colin Targonski on 3/14/16.
//  Copyright © 2016 uRides Corporation. All rights reserved.
//

import Foundation
import Stripe

class PaymentViewController: UIViewController, STPPaymentCardTextFieldDelegate {

    
    var paymentTextField = STPPaymentCardTextField()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.paymentTextField = STPPaymentCardTextField(frame: CGRectMake(15, 15, CGRectGetWidth(self.view.frame) - 30, 44))
        self.paymentTextField.delegate = self
        self.view!.addSubview(self.paymentTextField)
    }
        //view.sendSubviewToBack(backgroundImage)



    func paymentCardTextFieldDidChange(textField: STPPaymentCardTextField) {
        // Toggle navigation, for example
        //saveButton.enabled = textField.valid
    }
    
}