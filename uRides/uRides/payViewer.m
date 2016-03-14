#import "ViewController.h"
#import <Stripe/Stripe.h>

@interface payViewer () <STPPaymentCardTextFieldDelegate>

@property (nonatomic) STPPaymentCardTextField *paymentTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation payViewer

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.paymentTextField = [[STPPaymentCardTextField alloc]
                             initWithFrame:CGRectMake(15, 130, CGRectGetWidth(self.view.frame) - 30, 44)];;
    self.paymentTextField.delegate = self;
    [self.view addSubview:self.paymentTextField];
    [self.view bringSubviewToFront:self.paymentTextField];

    self.submitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.submitButton.frame = CGRectMake(15, 150, 100, 44);
    self.submitButton.enabled = NO;
    [self.submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [self.submitButton addTarget:self action:@selector(submitCard:) forControlEvents:UIControlEventTouchUpInside];
    [self.submitButton sizeToFit];
    [self.view addSubview:self.submitButton];
}

- (void)paymentCardTextFieldDidChange:(STPPaymentCardTextField *)textField {
    self.submitButton.enabled = textField.isValid;
}

- (IBAction)submitCard:(id)sender {
    // If you have your own form for getting credit card information, you can construct
    // your own STPCardParams from number, month, year, and CVV.
    STPCardParams* card = [self.paymentTextField cardParams];
    [[STPAPIClient sharedClient]
     createTokenWithCard:card
     completion:^(STPToken *token, NSError *error) {
         if (token) {
             // TODO: send the token to your server so it can create a charge
             UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Welcome to Stripe"
                                                                            message:[NSString stringWithFormat:@"Token created: %@", token]
                                                                     preferredStyle:UIAlertControllerStyleAlert];
             [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
             [self presentViewController:alert animated:YES completion:nil];
         } else {
             NSLog(@"Error creating token: %@", error.localizedDescription);
         }
     }];
}
@end
