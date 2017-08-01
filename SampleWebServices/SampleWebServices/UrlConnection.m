//
//  UrlConnection.m
//  SampleWebServices
//
//  Created by Asquare Mobile Technologies on 4/20/17.
//  Copyright © 2017 Asquare Mobile Technologies. All rights reserved.
//

#import "UrlConnection.h"

@implementation UrlConnection
-(void)PostWebServices:(NSDictionary *)Perameters sec:(NSString *)Urlstr{
   // NSString *urlstr= @"http://www.asquareit.com/asquare/api/login";
    NSURL *url=[NSURL URLWithString:Urlstr];
    NSMutableURLRequest *URLREQ=[NSMutableURLRequest requestWithURL:url];
    URLREQ.HTTPMethod=@"post";
   // NSDictionary *perametersDict=[NSDictionary dictionaryWithObjectsAndKeys:self.EmailFld.text,@"email",self.PassWdFld.text,@"password",nil];
    NSData *prettyJson = [NSJSONSerialization dataWithJSONObject:Perameters options:NSJSONWritingPrettyPrinted error:nil];
    URLREQ.HTTPBody = prettyJson;
    [URLREQ addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [URLREQ addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSURLConnection *URLCONECTION=[NSURLConnection connectionWithRequest:URLREQ delegate:self];

}
@end
