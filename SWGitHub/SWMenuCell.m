//
//  LAMenuCell.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWMenuCell.h"

@interface SWMenuCell (){
   
}

@property (nonatomic,weak) IBOutlet UILabel* titleLb;
@property (nonatomic,weak) IBOutlet UIImageView* imgView;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint* widthImg;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint* heightImg;

@end

@implementation SWMenuCell

- (void)setContent:(NSDictionary *)content{
    _content = content;
    
    if(_content != nil){
        [_titleLb setText:_content[@"title"]];
        UIImage* image = [UIImage imageNamed:_content[@"image"]];
        [_imgView setImage:image];
        _widthImg.constant = image.size.width;
        _heightImg.constant = image.size.height;
    }
}

- (void)awakeFromNib{
    [super awakeFromNib];

    _imgView.tintColor = [UIColor colorWithRed:145.f/ 255.f green:152.f/ 255.f blue:160.f/ 255.f alpha:1.f];
    _titleLb.textColor = [UIColor colorWithRed:145.f/ 255.f green:152.f/ 255.f blue:160.f/ 255.f alpha:1.f];
    self.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"plahaMenu"]];
    
}
- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
  
    if(selected){
        _imgView.tintColor = [UIColor whiteColor];
        _titleLb.textColor = [UIColor whiteColor];
    } else {
        _imgView.tintColor = [UIColor colorWithRed:145.f/ 255.f green:152.f/ 255.f blue:160.f/ 255.f alpha:1.f];
        _titleLb.textColor = [UIColor colorWithRed:145.f/ 255.f green:152.f/ 255.f blue:160.f/ 255.f alpha:1.f];
    }

}
@end
