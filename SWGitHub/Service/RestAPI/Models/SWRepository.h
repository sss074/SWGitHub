//
//  Repository.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SWUser;

@interface SWRepository : NSObject

@property (nonatomic, strong) NSNumber *repositoryId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *apiUrl;
@property (nonatomic, strong) NSNumber *stargazersCount;
@property (nonatomic, strong) NSNumber *watchersCount;
@property (nonatomic, strong) NSNumber *isPrivateRepository;
@property (nonatomic, strong) NSNumber *isForkedRepository;
@property (nonatomic, strong) SWUser *owner;

@end
