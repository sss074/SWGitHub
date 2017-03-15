//
//  SWObjectManager.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "RKObjectManager.h"

@protocol RKObjectManagerProtocol <NSObject>

- (void) setupRequestDescriptors;
- (void) setupResponseDescriptors;

@end

@interface SWObjectManager : NSObject <RKObjectManagerProtocol>

@property (nonatomic,strong)RKObjectManager* sharedManager;

@end
