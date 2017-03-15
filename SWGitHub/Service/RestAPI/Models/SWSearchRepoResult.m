//
//  SWSearchRepoResult.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWSearchRepoResult.h"
#import "SWRepository.h"

@implementation SWSearchRepoResult

+ (NSDictionary *)attributesMapping {
    return @{@"items": @"items"
             };
}

+ (RKObjectMapping *)responseMapping {
    
    RKObjectMapping *responseMapping = [super responseMapping];
    [responseMapping addAttributeMappingsFromDictionary:[self attributesMapping]];
    
    return responseMapping;
}
+ (NSString *)pathPattern {
    return @"/search/repositories?q=";
}

+ (NSString *)keyPath {
    return nil;
}

+ (NSDictionary *)parameters {
    return @{};
}
+ (Class<SWRestKitMappableModel>)mappedObjectClass {
    return [SWSearchRepoResult class];
}


@end
