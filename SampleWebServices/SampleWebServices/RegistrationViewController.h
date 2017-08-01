//
//  RegistrationViewController.h
//  SampleWebServices
//
//  Created by Asquare Mobile Technologies on 4/20/17.
//  Copyright © 2017 Asquare Mobile Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationViewController : UIViewController<NSURLConnectionDelegate>
@property (weak, nonatomic) IBOutlet UITextField *Course;
- (IBAction)RegisterValues:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *Fname;
@property (weak, nonatomic) IBOutlet UITextField *Email;
@property (weak, nonatomic) IBOutlet UITextField *Mobile;
@property(nonatomic,strong)NSMutableData *data;

@end
