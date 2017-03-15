//
//  WSRestKitMappableModel.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#ifndef SWRestKitMappableModel_h
#define SWRestKitMappableModel_h

@class RKObjectMapping;

@protocol SWRestKitRequestMappableModel <NSObject>
+ (RKObjectMapping *)requestMapping;
@end

@protocol SWRestKitMappableModel <NSObject>
+ (RKObjectMapping *)responseMapping;
+ (NSDictionary<NSString *, NSString *> *)attributesMapping;
+ (NSString *)pathPattern;
+ (NSString *)keyPath;
+ (NSDictionary *)parameters;
+ (Class<SWRestKitMappableModel>)mappedObjectClass;
@optional
+ (RKObjectMapping *)requestMapping;
@end


#endif /* SWRestKitMappableModel_h */
