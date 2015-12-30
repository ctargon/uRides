//
//  PaymentViewController.swift
//
//  Created by Colin Targonski on 12/29/15.
//

import UIKit
import Stripe

class PaymentViewController: UIViewController, STPPaymentCardTextFieldDelegate {
    
    @IBOutlet weak var paymentTextField: STPPaymentCardTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.paymentTextField = STPPaymentCardTextField(frame: CGRectMake(15, 15, 370, 44))
        
        //self.paymentTextField.delegate = self
        
        //self.view!.addSubview(self.paymentTextField)

    }
    
    
    
}