//
//  UrlConnection.h
//  SampleWebServices
//
//  Created by Asquare Mobile Technologies on 4/20/17.
//  Copyright © 2017 Asquare Mobile Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlConnection : NSObject
-(void)PostWebServices:(NSDictionary *)Perameters sec:(NSString *)Urlstr;
@end
