//
//  UserManager.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWObjectManager.h"

@class SWUser;

@interface SWUserManager : SWObjectManager

- (void) loadAuthenticatedUser:(void (^)(SWUser *user))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;

@end
