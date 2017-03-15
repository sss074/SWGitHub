//
//  SWSearchRepoResult.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWBaseDataModel.h"

@class  SWUser;

@interface SWSearchRepoResult : SWBaseDataModel

@property (nonatomic, strong) NSNumber *total_count;
@property (nonatomic, strong) NSArray *items;


@end
