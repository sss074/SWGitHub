//
//  Repository.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWRepository.h"
#import "SWUser.h"

@implementation SWRepository

+ (NSDictionary *)attributesMapping {
    return @{@"id": @"repositoryId",
             @"full_name": @"fullName",
             @"description": @"ldescription"
             };
}

+ (RKObjectMapping *)responseMapping {
    
    RKObjectMapping *responseMapping = [super responseMapping];
    [responseMapping addAttributeMappingsFromDictionary:[self attributesMapping]];
    RKObjectMapping *ownerMapping = [SWUser responseMapping];
    [responseMapping addRelationshipMappingWithSourceKeyPath:@"owner" mapping:ownerMapping];
    
    return responseMapping;
}
+ (NSString *)pathPattern {
    return @"/user/repos";
}

+ (NSString *)keyPath {
    return nil;
}

+ (NSDictionary *)parameters {
    return @{};
}
+ (Class<SWRestKitMappableModel>)mappedObjectClass {
    return [SWRepository class];
}

@end
