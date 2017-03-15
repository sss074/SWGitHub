//
//  LAMenuController.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWMenuController.h"
#import "RESideMenu.h"
#import "SWMenuCell.h"
#import <SDVersion/SDVersion.h>
#import "SWWebManager.h"
#import "SWUser.h"
#import "SWRepoController.h"

static CGFloat SB3DOT5SIZE = 216.f;
static CGFloat SB4DOT7SIZE = 250.4f;
static CGFloat SB5DOT5SIZE = 273.75f;
static CGFloat TB3DOT5SIZE = 230.f;
static CGFloat TB4DOT7SIZE = 264.4f;
static CGFloat TB5DOT5SIZE = 288.75f;

@interface SWMenuController () <UICollectionViewDelegate,UICollectionViewDataSource>{
    NSArray* content;
    NSInteger curIndex;
  
}

@property (nonatomic,weak) IBOutlet UIImageView* logoImgView;
@property (nonatomic,weak) IBOutlet UILabel* nameLb;
@property (nonatomic,weak) IBOutlet UILabel* loginLb;
@property (nonatomic,weak) IBOutlet UIView* logoView;
@property (nonatomic,weak) IBOutlet UICollectionView* collectionView;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint* offsetLogo;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint* offsetCoolection;
@end

@implementation SWMenuController


- (void)viewDidLoad {
    [super viewDidLoad];
   

    curIndex = 1;
    
    content = @[@{@"image":@"",@"title":@""},
                @{@"image":@"icMenuProfile",@"title":REPOTITLE},
                @{@"image":@"icMenuSearch",@"title":SEARCHTITLE},
                @{@"image":@"",@"title":@""},
                @{@"image":@"",@"title":@""},
                @{@"image":@"",@"title":@""},
                @{@"image":@"",@"title":@""},
                @{@"image":@"",@"title":@""},
                @{@"image":@"",@"title":@""},
                @{@"image":@"icMenuExit",@"title":EXITTITLE}
                ];
   
    DeviceSize size = [SDiOSVersion deviceSize];
    CGFloat posSB = SB3DOT5SIZE;
    CGFloat posTB = TB3DOT5SIZE;
    
    switch (size) {
        case Screen4Dot7inch:
            posSB = SB4DOT7SIZE;
            posTB = TB4DOT7SIZE;
            break;
        case Screen5Dot5inch:
            posSB = SB5DOT5SIZE;
            posTB = TB5DOT5SIZE;
            break;
        default:
            break;
    }
    
    _offsetLogo.constant = CGRectGetWidth(self.view.frame) - posSB;
    _offsetCoolection.constant = CGRectGetWidth(self.view.frame) - posTB;
    [_collectionView reloadData];

    [self userInfo];
   
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [_collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:curIndex inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionTop];

}


#pragma mark - Service methods

- (void)userInfo{
    [[SWWebManager sharedManager]loadAuthenticatedUser:^(SWUser *user) {
      
        if(user != nil){
            NSURL *thumbnailURL = [NSURL URLWithString:user.avatarUrl];
      
            [[SDImageCache sharedImageCache] queryDiskCacheForKey:[thumbnailURL absoluteString] done:^(UIImage *image, SDImageCacheType cacheType) {
                if(image == nil){
                    [_logoImgView sd_setImageWithURL:thumbnailURL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                        if(image != nil){
                            [_logoImgView setImage:image];
                            [[SDImageCache sharedImageCache] storeImage:image forKey:[thumbnailURL absoluteString] toDisk:YES];
                        }
                    }];
                } else {
                    [_logoImgView setImage:image];
                }
            }];
            
            _loginLb.text = user.login;
            _nameLb.text = user.name;
        }
        
    }];
}

#pragma mark - UICollectionView layout delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}
#pragma mark - UICollectionView datasourse

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return content.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary* dict = content[indexPath.row];
    
    static NSString *cellIdentifier = @"menuCell";
    SWMenuCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.content = dict;
    return cell;
    
}
#pragma mark - UICollectionView delegate

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == content.count - 2)
        return CGSizeMake(CGRectGetWidth(_collectionView.frame), 20.f);
    return CGSizeMake(CGRectGetWidth(_collectionView.frame), 52.f);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
    TheApp;
    
    curIndex = indexPath.row;
    
    RESideMenu* masterController = (RESideMenu*)app.window.rootViewController;
 
    if(curIndex == content.count - 1){
        if([masterController respondsToSelector:@selector(hideMenuViewController)])
            [masterController hideMenuViewController];
        [self clearPresentForClassDescriptor];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"userInfo"];
        [[NSUserDefaults standardUserDefaults]synchronize];

        app.window.rootViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"LoginController"];
        return;
    } else if(curIndex == 1 ||curIndex == 2){
        UINavigationController* navController = [self checkPresentForClassDescriptor:@"NavRepoController"];
        SWRepoController* controller = (SWRepoController*)[[navController viewControllers]firstObject];
        controller.isSearch = (curIndex == 2) ? YES : NO;
        
        if(controller != nil)
            masterController.contentViewController = navController;
    }

    if([masterController respondsToSelector:@selector(hideMenuViewController)])
        [masterController hideMenuViewController];
}

@end
