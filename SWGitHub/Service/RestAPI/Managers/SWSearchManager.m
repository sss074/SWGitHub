//
//  SWSearchManager.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWSearchManager.h"
#import "SWSearchRepoResult.h"
#import "SWRepository.h"

@implementation SWSearchManager


- (void) searchRepositoriesUser:(NSString*)param success:(void (^)(NSArray<SWRepository *> *repo))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure{
    
    [self showIndecator:YES];
    
    [self.sharedManager getObjectsAtPath:[NSString stringWithFormat:@"%@%@",[SWSearchRepoResult pathPattern],param] parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [self showIndecator:NO];
        if (success) {
            SWSearchRepoResult* obj = (SWSearchRepoResult*)mappingResult.firstObject;
            success(obj.items);
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
    
    RKResponseDescriptor *repoResponseDescriptors = [RKResponseDescriptor responseDescriptorWithMapping:[SWSearchRepoResult responseMapping] method:RKRequestMethodGET pathPattern:nil keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [self.sharedManager addResponseDescriptor:repoResponseDescriptors];
}


@end
