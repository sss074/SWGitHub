//
//  User.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWBaseDataModel.h"

@interface SWUser : SWBaseDataModel <SWRestKitMappableModel>

@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *publicReposCount;
@property (nonatomic, strong) NSString *email;

@end
