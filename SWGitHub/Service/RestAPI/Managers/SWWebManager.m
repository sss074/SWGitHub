//
//  SWWebManager.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWWebManager.h"
#import "SWUserManager.h"
#import "SWRepoManager.h"
#import "SWSearchManager.h"

static SWWebManager *sharedManager = nil;


@implementation SWWebManager

//+ (instancetype)sharedManager {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedManager = [[SWWebManager alloc]init];
//    });
//    
//    return sharedManager;
//}

#pragma mark - Public methods

- (void) loadAuthenticatedUser:(void (^)(SWUser *user))success{
    
    [self showIndecator:YES];
    [[SWUserManager sharedManager] loadAuthenticatedUser:^(SWUser *user) {
        [self showIndecator:NO];
       success(user);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [self showIndecator:NO];
    }];
}
- (void) repositoriesUser:(void (^)(NSArray<SWRepository *> *repo))success{
    [self showIndecator:YES];
    [[SWRepoManager sharedManager] repositoriesUser:^(NSArray<SWRepository *> *repos){
        [self showIndecator:NO];
       success(repos);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [self showIndecator:NO];
    }];
}

- (void) searchRepositoriesUser:(NSString*)param complition:(void (^)(NSArray<SWRepository *> *repo))success{
     [self showIndecator:YES];
    [[SWSearchManager sharedManager] searchRepositoriesUser:param
    success:^(NSArray<SWRepository *> *repo) {
        [self showIndecator:NO];
        success(repo);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [self showIndecator:NO];
    }];
}

@end
