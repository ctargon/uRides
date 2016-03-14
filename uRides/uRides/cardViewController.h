//
//  cardViewController.h
//  uRides
//
//  Created by Colin Targonski on 3/14/16.
//  Copyright © 2016 uRides Corporation. All rights reserved.
//

- (void)viewWillAppear:(BOOL);

- (IBAction)scanCard:(id)sender;

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)scanViewController;

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)scanViewController;
