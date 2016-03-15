//
//  cardViewController.swift
//  uRides
//
//  Created by Colin Targonski on 3/14/16.
//  Copyright © 2016 uRides Corporation. All rights reserved.
//

import Foundation
import UIKit

class cardIOView: UIViewController, CardIOPaymentViewControllerDelegate {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CardIOUtilities.preload()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func scanCard(sender: AnyObject) {
        let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)
        cardIOVC.modalPresentationStyle = .FormSheet
        presentViewController(cardIOVC, animated: true, completion: nil)
    }
    
    func userDidCancelPaymentViewController(paymentViewController:
        CardIOPaymentViewController!) {
            resultLabel.text = "user canceled"
        paymentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 3/14/16 as of now cardInfo is not being saved and is being passed as NULL, need cardInfo to create
    // token to stripe!!!!!!! -CT
    func userDidProvideCreditCardInfo(cardInfo: CardIOCreditCardInfo!, inPaymentViewController paymentViewController: CardIOPaymentViewController!) {
        
            let str = NSString(format: "Received card info.\n Number: %@\n expiry: %02lu/%lu\n cvv: %@.", cardInfo.redactedCardNumber, cardInfo.expiryMonth, cardInfo.expiryYear, cardInfo.cvv)
            resultLabel.text = str as String
        
        paymentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }  
}