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


@implementation SWObjectManager

- (instancetype)init{
 
    self = [super init];
    
    if(self){
        
        NSURL *url = [NSURL URLWithString:kDevBaseApiUrl];
        self.sharedManager = [RKObjectManager managerWithBaseURL:url];
        _sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;
        [self setupRequestDescriptors];
        [self setupResponseDescriptors];

        NSDictionary* userInfo = [[NSUserDefaults standardUserDefaults]objectForKey:@"userInfo"];
        if(userInfo != nil){
             [_sharedManager.HTTPClient setDefaultHeader:@"Authorization" value: [NSString stringWithFormat:@"Basic %@", [[[NSString stringWithFormat:@"%@:%@", userInfo[@"login"],userInfo[@"password"]] dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString]]];
        }
     
    }

    return self;
}

- (void) setupRequestDescriptors {
}

- (void) setupResponseDescriptors {
}

@end
