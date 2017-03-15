//
//  ViewController.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWRepoController.h"
#import "SWWebManager.h"
#import "SWSearchRepoResult.h"
#import "SWRepoCell.h"
#import "SWRepository.h"

#define CELLSIZE 110.f
#define HEADERSIZE 60.f

@interface SWRepoController ()<UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate>{
    NSArray* content;
}
@property (nonatomic,weak) IBOutlet UICollectionView* collectionView;

@end

@implementation SWRepoController

- (void) setIsSearch:(BOOL)isSearch{
    _isSearch = isSearch;
    
    self.title = _isSearch ? @"Поиск" : @"Мои репозитории";
}

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self setupNavBtn:BASETYPE];
 
    [self getContent];
}

#pragma mark - Service methods

- (void)getContent{
    if(!_isSearch){
        [[SWWebManager sharedManager]repositoriesUser:^(NSArray<SWRepository *> *result) {
            content = [NSArray arrayWithArray:result];
            [_collectionView reloadData];
        }];
    } else {
        content = nil;
        [_collectionView reloadData];
    }
}

#pragma mark - UICollectionView layout delegate
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if(_isSearch){
        NSString *identifier = @"repoHeader";
        UICollectionReusableView * supplementaryView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier forIndexPath:indexPath];
        
        
        return supplementaryView;
    }
    
    return  nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if(_isSearch){
        return CGSizeMake(CGRectGetWidth(self.view.bounds), HEADERSIZE);
    }
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
    
    static NSString *cellIdentifier = @"repoCell";
    SWRepoCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.content = (SWRepository*) content[indexPath.row];
    return cell;
    
}
#pragma mark - UICollectionView delegate

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    return CGSizeMake(CGRectGetWidth(_collectionView.frame), CELLSIZE);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
#pragma mark - UISearchBar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
   
    if(![searchBar.text isEqualToString:@""]){
        [searchBar setUserInteractionEnabled:NO];
        [[SWWebManager sharedManager]searchRepositoriesUser:searchBar.text complition:^(NSArray<SWRepository *> *result) {
            content = [NSArray arrayWithArray:result];
            [_collectionView reloadData];
            [searchBar setUserInteractionEnabled:YES];
        }];
    }

}
@end
