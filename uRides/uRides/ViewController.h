//
//  ViewController.h
//  StripeExample
//
//  Created by Jack Flintermann on 8/21/14.
//  Copyright (c) 2014 Stripe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol STPBackendCharging <NSObject>

//- (void)createBackendChargeWithToken:(STPToken *)token completion:(STPTokenSubmissionHandler)completion;

@end

@interface payViewer : UIViewController<STPBackendCharging>

@end