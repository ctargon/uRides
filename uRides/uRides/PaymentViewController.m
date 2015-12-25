//
//  PaymentViewController.m
//  uRides
//
//  Created by Colin Targonski on 12/25/15.
//  Copyright © 2015 uRides Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentViewController.h"

// PaymentViewController.m

@interface PaymentViewController ()<STPPaymentCardTextFieldDelegate>

@property(nonatomic) STPPaymentCardTextField *paymentTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.paymentTextField = [[STPPaymentCardTextField alloc] initWithFrame:CGRectMake(15, 15, CGRectGetWidth(self.view.frame) - 30, 44)];
    self.paymentTextField.delegate = self;
    [self.view addSubview:self.paymentTextField];
}

- (void)paymentCardTextFieldDidChange:(STPPaymentCardTextField *)textField {
    {
        // Toggle navigation, for example
        self.saveButton.enabled = textField.isValid;
    }
    
@end