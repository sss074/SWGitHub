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

    
    [self showIndecator:YES];
    
    [self.sharedManager getObjectsAtPath:[SWUser pathPattern] parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [self showIndecator:NO];
        if (success) {
            SWUser *currentUser = (SWUser *)[mappingResult.array firstObject];
            if(success)
                success(currentUser);
        }
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [self showIndecator:NO];
        [self showAlertMessage:ERRRORLOGIN];
        if (failure) {
            failure(operation, error);
        }
    }];
}

#pragma mark - Setup Helpers

- (void) setupResponseDescriptors {
   
    [super setupResponseDescriptors];

    RKResponseDescriptor *authenticatedUserResponseDescriptors = [RKResponseDescriptor responseDescriptorWithMapping:[SWUser responseMapping] method:RKRequestMethodGET pathPattern:[SWUser pathPattern] keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [self.sharedManager addResponseDescriptor:authenticatedUserResponseDescriptors];
 
}

@end
