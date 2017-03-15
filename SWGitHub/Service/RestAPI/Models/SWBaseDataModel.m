//
//  SWBaseDataModel.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWBaseDataModel.h"

@implementation SWBaseDataModel

+ (NSDictionary *)attributesMapping {
    return  @{};
}

+ (RKObjectMapping *)responseMapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
    return mapping;
}
+ (RKObjectMapping *)requestMapping{
    return  nil;
}

+ (NSString *)pathPattern {
    return nil;
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
