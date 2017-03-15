//
//  SWRepoManager.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWRepoManager.h"
#import "SWRepository.h"


@implementation SWRepoManager


- (void) repositoriesUser:(void (^)(NSArray<SWRepository *> *repo))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure{
    
    [self showIndecator:YES];
    
    [self.sharedManager getObjectsAtPath:[SWRepository pathPattern] parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [self showIndecator:NO];
        if (success) {
            success((NSArray<SWRepository *>*)mappingResult.array);
        }
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [self showIndecator:NO];
        [self showAlertMessage:error.description];
        if (failure) {
            failure(operation, error);
        }
    }];
}

#pragma mark - Setup Helpers

- (void) setupResponseDescriptors {
    
    [super setupResponseDescriptors];
  
    RKResponseDescriptor *repoResponseDescriptors = [RKResponseDescriptor responseDescriptorWithMapping:[SWRepository responseMapping] method:RKRequestMethodGET pathPattern:nil keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [self.sharedManager addResponseDescriptor:repoResponseDescriptors];
}


@end
