//
//  ViewController.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "ViewController.h"
#import "SWUserManager.h"
#import "SWRepoManager.h"
#import "SWUser.h"

@interface ViewController ()

@property (nonatomic, strong) SWUser *authenticatedUser;

@end

@implementation ViewController
- (void)setAuthenticatedUser:(SWUser *)authenticatedUser {
    if (_authenticatedUser != authenticatedUser) {
        _authenticatedUser = authenticatedUser;
//        self.welcomeLabel.text = [NSString stringWithFormat:@"Welcome, %@!", authenticatedUser.name];
//        
//        self.loginLabel.text = authenticatedUser.login;
//        self.publicGistsCountLabel.text = [NSString stringWithFormat:@"%@", authenticatedUser.publicGistsCount];
//        self.publicReposCountLabel.text = [NSString stringWithFormat:@"%@", authenticatedUser.publicReposCount];
//        
//        NSURLRequest *avatarUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:authenticatedUser.avatarUrl]];
//        AFImageRequestOperation *requestOperation = [AFImageRequestOperation imageRequestOperationWithRequest:avatarUrlRequest success:^(UIImage *image) {
//            self.avatarImageView.image = image;
//        }];
//        [requestOperation start];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[SWUserManager sharedManager] loadAuthenticatedUser:^(SWUser *user) {
//        self.authenticatedUser = user;
//    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
//        NSLog(@"error occured: %@", error);
//    }];
    [[SWRepoManager sharedManager] repositoriesUser:^(NSArray<SWRepository *> *repos){
        NSLog(@"repos : %@", repos);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        
    }];
    
}


@end
