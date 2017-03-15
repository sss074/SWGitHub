//
//  SWWebManager.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWUser.h"
#import "SWRepository.h"
#import "SWUser.h"

@interface SWWebManager : NSObject

+ (instancetype) sharedManager;

- (void) loadAuthenticatedUser:(void (^)(SWUser *user))success ;
- (void) repositoriesUser:(void (^)(NSArray<SWRepository *> *repo))success ;
- (void) searchRepositoriesUser:(NSString*)param complition:(void (^)(NSArray<SWRepository *> *repo))success;

@end
