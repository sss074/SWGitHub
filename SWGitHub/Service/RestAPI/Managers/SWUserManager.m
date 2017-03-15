//
//  UserManager.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWUserManager.h"
#import "SWUser.h"


@implementation SWUserManager 

- (void) loadAuthenticatedUser:(void (^)(SWUser *))success failure:(void (^)(RKObjectRequestOperation *, NSError *))failure {

    
    [self getObjectsAtPath:[SWUser pathPattern] parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (success) {
            SWUser *currentUser = (SWUser *)[mappingResult.array firstObject];
            success(currentUser);
        }
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation, error);
        }
    }];
}

#pragma mark - Setup Helpers

- (void) setupResponseDescriptors {
   
    [super setupResponseDescriptors];

    RKResponseDescriptor *authenticatedUserResponseDescriptors = [RKResponseDescriptor responseDescriptorWithMapping:[SWUser responseMapping] method:RKRequestMethodGET pathPattern:[SWUser pathPattern] keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [self addResponseDescriptor:authenticatedUserResponseDescriptors];
 
}

@end
