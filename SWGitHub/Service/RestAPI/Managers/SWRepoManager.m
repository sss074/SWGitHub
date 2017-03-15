//
//  SWRepoManager.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWRepoManager.h"
#import <RestKit/RestKit.h>
#import "MappingProvider.h"
#import "SWRepository.h"

@implementation SWRepoManager


- (void) repositoriesUser:(void (^)(NSArray<SWRepository *> *repo))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure{
    
    [self getObjectsAtPath:@"/user/repos" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (success) {
            success((NSArray<SWRepository *>*)mappingResult.array);
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
  
    RKResponseDescriptor *repoResponseDescriptors = [RKResponseDescriptor responseDescriptorWithMapping:[MappingProvider repositoryMapping] method:RKRequestMethodGET pathPattern:nil keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [self addResponseDescriptor:repoResponseDescriptors];
}


@end
