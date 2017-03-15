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
    
    [self getObjectsAtPath:[NSString stringWithFormat:@"%@%@",[SWSearchRepoResult pathPattern],param] parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (success) {
            SWSearchRepoResult* obj = (SWSearchRepoResult*)mappingResult.firstObject;
            success((NSArray<SWRepository *>*)obj.items);
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
    
    RKResponseDescriptor *repoResponseDescriptors = [RKResponseDescriptor responseDescriptorWithMapping:[SWSearchRepoResult responseMapping] method:RKRequestMethodGET pathPattern:nil keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [self addResponseDescriptor:repoResponseDescriptors];
}


@end
