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
       
        NSURL *url = [NSURL URLWithString:BASE_URL];

        sharedManager = [self managerWithBaseURL:url];
        sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;
        [sharedManager setupRequestDescriptors];
        [sharedManager setupResponseDescriptors];
        [sharedManager.HTTPClient setDefaultHeader:@"Authorization" value: [NSString stringWithFormat:@"Basic %@", [[[NSString stringWithFormat:@"%@:%@", @"sss074@rambler.ru", @"fazawaka1978"] dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString]]];
    });

    return sharedManager;
}

- (void) setupRequestDescriptors {
}

- (void) setupResponseDescriptors {
}

@end
