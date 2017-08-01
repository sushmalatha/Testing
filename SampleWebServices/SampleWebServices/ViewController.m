//
//  ViewController.m
//  SampleWebServices
//
//  Created by Asquare Mobile Technologies on 4/20/17.
//  Copyright © 2017 Asquare Mobile Technologies. All rights reserved.
//

#import "ViewController.h"
#import "UrlConnection.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.PassWdFld.secureTextEntry=YES;
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)postWbServices{
    NSString *urlstr= @"http://www.asquareit.com/asquare/api/login";
    NSURL *url=[NSURL URLWithString:urlstr];
  NSMutableURLRequest *URLREQ=[NSMutableURLRequest requestWithURL:url];
    URLREQ.HTTPMethod=@"post";
    NSDictionary *perametersDict=[NSDictionary dictionaryWithObjectsAndKeys:self.EmailFld.text,@"email",self.PassWdFld.text,@"password",nil];
    NSData *prettyJson = [NSJSONSerialization dataWithJSONObject:perametersDict options:NSJSONWritingPrettyPrinted error:nil];
    URLREQ.HTTPBody = prettyJson;
    [URLREQ addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [URLREQ addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSURLConnection *URLCONECTION=[NSURLConnection connectionWithRequest:URLREQ delegate:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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

- (IBAction)LOGINACTION:(UIButton *)sender {
    [self postWbServices];
}

- (IBAction)SignUp:(UIButton *)sender {
    [self performSegueWithIdentifier:@"RegisterIdentifier" sender:nil];
}
@end
