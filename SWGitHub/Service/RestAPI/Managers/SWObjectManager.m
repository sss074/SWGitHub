//
//  SWObjectManager.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWObjectManager.h"
#import <RestKit/RestKit.h>
#import "AppConstants.h"
#import "NSData+Base64.h"

static SWObjectManager *sharedManager = nil;

@implementation SWObjectManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        NSURL *url = [NSURL URLWithString:kDevBaseApiUrl];

        sharedManager = [self managerWithBaseURL:url];
        sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;
        [sharedManager setupRequestDescriptors];
        [sharedManager setupResponseDescriptors];
        
        NSDictionary* userInfo = [[NSUserDefaults standardUserDefaults]objectForKey:@"userInfo"];
        if(userInfo != nil){
             [sharedManager.HTTPClient setDefaultHeader:@"Authorization" value: [NSString stringWithFormat:@"Basic %@", [[[NSString stringWithFormat:@"%@:%@", userInfo[@"login"],userInfo[@"password"]] dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString]]];
        }
//        NSData *data = [NSString stringWithFormat:@"Basic %@", [[[NSString stringWithFormat:@"%@:%@", @"sss074@rambler.ru", @"fazawaka1978"] dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString]];
        [sharedManager.HTTPClient setDefaultHeader:@"Authorization" value: [NSString stringWithFormat:@"Basic %@", [[[NSString stringWithFormat:@"%@:%@", @"sss074@rambler.ru", @"fazawaka1978"] dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString]]];
    });

    return sharedManager;
}

- (void) setupRequestDescriptors {
}

- (void) setupResponseDescriptors {
}

@end
