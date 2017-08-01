//
//  RegistrationViewController.m
//  SampleWebServices
//
//  Created by Asquare Mobile Technologies on 4/20/17.
//  Copyright © 2017 Asquare Mobile Technologies. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*-(void)Getvalues{
    
    NSURL *url = [NSURL URLWithString:@"http://www.asquareit.com/asquare/api/register"];
   
    NSMutableURLRequest *URLREQ=[NSMutableURLRequest requestWithURL:url];
    URLREQ.HTTPMethod=@"post";
    
    NSData *prettyJson = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    URLREQ.HTTPBody = prettyJson;
    [URLREQ addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [URLREQ addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSURLConnection *URLCONECTION=[NSURLConnection connectionWithRequest:URLREQ delegate:self];
}*/
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Error::%@",[error localizedDescription]);
    
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    self.data=[NSMutableData data];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.data appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    id recivedata=[NSJSONSerialization JSONObjectWithData:self.data options:nil error:nil];
    NSLog(@"recivedData::%@",recivedata);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)RegisterValues:(UIButton *)sender {
    [self postWbServices];
}
-(void)postWbServices{
    NSString *urlstr= @"http://www.asquareit.com/asquare/api/register";
    NSURL *url=[NSURL URLWithString:urlstr];
    NSMutableURLRequest *URLREQ=[NSMutableURLRequest requestWithURL:url];
    URLREQ.HTTPMethod=@"post";
    
    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:self.Fname.text,@"name", self.Email.text,@"email",self.Mobile.text,@"phone",self.Course.text,@"course_type",nil];
   // NSDictionary *dictValues = [NSDictionary dictionaryWithObjectsAndKeys:self.fnameFld.text,@"name",self.emailFld.text,@"email",self.mobileFld.text,@"phone",self.lnameFld.text,@"course_type", nil];
    
    NSData *prettyJson = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    URLREQ.HTTPBody = prettyJson;
    [URLREQ addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [URLREQ addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSURLConnection *URLCONECTION=[NSURLConnection connectionWithRequest:URLREQ delegate:self];
}
@end
