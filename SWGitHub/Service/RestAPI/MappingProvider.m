//
//  MappingProvider.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "MappingProvider.h"
#import <RestKit/RestKit.h>
#import "SWUser.h"
#import "SWRepository.h"

@implementation MappingProvider

+ (RKObjectMapping *)userMapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[SWUser class]];
    NSDictionary *mappingDictionary = @{@"login": @"login",
                                        @"id": @"userId",
                                        @"avatar_url": @"avatarUrl",
                                        @"name": @"name",
                                        @"public_repos": @"publicReposCount",
                                        @"email": @"email"
                                        };

    [mapping addAttributeMappingsFromDictionary:mappingDictionary];

    return mapping;
}

+ (RKObjectMapping *)repositoryMapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[SWRepository class]];
    NSDictionary *mappingDictionary = @{@"id": @"repositoryId",
                                        @"name": @"",
                                        @"full_name": @"fullName",
                                        @"description": @"description",
                                        @"url": @"apiUrl",
                                        @"stargazers_count": @"stargazersCount",
                                        @"watchers_count": @"watchersCount",
                                        @"private": @"isPrivateRepository",
                                        @"fork": @"isForkedRepository"};

    [mapping addAttributeMappingsFromDictionary:mappingDictionary];
    [mapping addRelationshipMappingWithSourceKeyPath:@"owner" mapping:[self userMapping]];

    return mapping;
}

@end
