//
//  SWSearchRepoResult.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWBaseDataModel.h"

@class  SWRepository;

@interface SWSearchRepoResult : SWBaseDataModel

@property (nonatomic, strong) NSArray <SWRepository *> *items;

@end
