//
//  SWRepoCell.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  SWRepository;

@interface SWRepoCell : UICollectionViewCell

@property (nonatomic, strong) SWRepository* content;

@end
