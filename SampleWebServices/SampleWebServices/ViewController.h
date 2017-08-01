//
//  ViewController.h
//  SampleWebServices
//
//  Created by Asquare Mobile Technologies on 4/20/17.
//  Copyright © 2017 Asquare Mobile Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDelegate>

@property (weak, nonatomic) IBOutlet UITextField *EmailFld;
@property (weak, nonatomic) IBOutlet UITextField *PassWdFld;
- (IBAction)LOGINACTION:(UIButton *)sender;
- (IBAction)SignUp:(UIButton *)sender;
@property(nonatomic,strong)NSMutableData *data;

@end

