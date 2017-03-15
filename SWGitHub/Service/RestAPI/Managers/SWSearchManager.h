//
//  SWSearchManager.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWObjectManager.h"


@class  SWRepository;

@interface SWSearchManager : SWObjectManager

- (void) searchRepositoriesUser:(NSString*)param success:(void (^)(NSArray<SWRepository *> *repo))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;


@end
