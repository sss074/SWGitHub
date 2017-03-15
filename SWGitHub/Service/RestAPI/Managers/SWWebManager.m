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

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[SWWebManager alloc]init];
    });
    
    return sharedManager;
}

#pragma mark - Public methods

- (void) loadAuthenticatedUser:(void (^)(SWUser *user))success{
  
    SWUserManager *manager = [[SWUserManager alloc]init];
  
    [manager loadAuthenticatedUser:^(SWUser *user) {
        if(success)
            success(user);
    } failure:nil];
}
- (void) repositoriesUser:(void (^)(NSArray<SWRepository *> *repo))success{
    
    SWRepoManager *manager = [[SWRepoManager alloc]init];

    [manager repositoriesUser:^(NSArray<SWRepository *> *repos){
        if(success)
            success(repos);
    } failure:nil];
}

- (void) searchRepositoriesUser:(NSString*)param complition:(void (^)(NSArray<SWRepository *> *repo))success{
    
    SWSearchManager *manager = [[SWSearchManager alloc]init];
     [self showIndecator:YES];    [manager searchRepositoriesUser:param
    success:^(NSArray<SWRepository *> *repo) {

        if(success)
            success(repo);
    } failure:nil];
}

@end
