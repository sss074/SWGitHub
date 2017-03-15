//
//  SWRepoCell.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWRepoCell.h"
#import "SWRepository.h"

@interface SWRepoCell ()

@property (nonatomic,weak) IBOutlet UILabel* titleLb;
@property (nonatomic,weak) IBOutlet UILabel* descriptionLb;

@end


@implementation SWRepoCell

- (void)setContent:(SWRepository *)content{
    _content = content;
    
    if(_content != nil){
        _titleLb.text = _content.fullName;
        _descriptionLb.text = _content.ldescription;
    }
}

- (void)awakeFromNib{
    [super awakeFromNib];
   
    
}

@end
