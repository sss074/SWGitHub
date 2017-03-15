//
//  User.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWUser.h"


@implementation SWUser

+ (NSDictionary *)attributesMapping {
    return @{@"login": @"login",
             @"id": @"userId",
             @"avatar_url": @"avatarUrl",
             @"name": @"name",
             @"public_repos": @"publicReposCount",
             @"email": @"email"
             };
}

+ (RKObjectMapping *)responseMapping {
  
    RKObjectMapping *responseMapping = [super responseMapping];
    [responseMapping addAttributeMappingsFromDictionary:[self attributesMapping]];

    return responseMapping;
}

+ (NSString *)pathPattern {
    return @"/user";
}

+ (NSString *)keyPath {
    return nil;
}

+ (NSDictionary *)parameters {
    return @{};
}
+ (Class<SWRestKitMappableModel>)mappedObjectClass {
    return [SWBaseDataModel class];
}
@end
