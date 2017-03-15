//
//  Repository.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWBaseDataModel.h"

@class SWUser;

@interface SWRepository : SWBaseDataModel <SWRestKitMappableModel>

@property (nonatomic, strong) NSNumber *repositoryId;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *ldescription;
@property (nonatomic, strong) SWUser *owner;

@end
