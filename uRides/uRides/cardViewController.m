//
//  cardViewController.m
//  uRides
//
//  Created by Colin Targonski on 3/14/16.
//  Copyright © 2016 uRides Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cardViewController.h"
#import "CardIO.h"

@interface cardViewController : UIViewController<CardIOPaymentViewControllerDelegate>

// SomeViewController.m

- (void)viewWillAppear:(BOOL) {
    [super viewWillAppear:animated];
    [CardIOUtilities preload];
}


- (IBAction)scanCard:(id)sender {
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    [self presentViewController:scanViewController animated:YES completion:nil];
}


- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    NSLog(@"User canceled payment info");
    // Handle user cancellation here...
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    // The full card number is available as info.cardNumber, but don't log that!
    NSLog(@"Received card info. Number: %@, expiry: %02i/%i, cvv: %@.", info.redactedCardNumber, info.expiryMonth, info.expiryYear, info.cvv);
    // Use the card info...
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
