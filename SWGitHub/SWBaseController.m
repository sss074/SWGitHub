//
//  ViewController.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWBaseController.h"

@interface SWBaseController () <RESideMenuDelegate>{

}

@end

@implementation SWBaseController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
  
    [self.navigationController setNavigationBarHidden:NO animated:NO];

//    self.navigationItem.title = @"";
//    
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//        self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
//    }
    
    
}

#pragma mark - Service methods


- (void)setupNavBtn:(NavBarType)type{
    
    UIButton *btn = nil;
    UIImage *btnImg  = nil;
    UIBarButtonItem *barBtnItem = nil;
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.rightBarButtonItems = nil;
    
    switch (type) {
        case BASETYPE:{
            btnImg = [UIImage imageNamed:@"icMenu"];
            btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(0.f, 0.f, btnImg.size.width, btnImg.size.height);
            [btn setImage:btnImg forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnMorePressed) forControlEvents:UIControlEventTouchUpInside];
            barBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
            self.navigationItem.leftBarButtonItem = barBtnItem;
        }
            break;
        case BACKTYPE: {
            btnImg = [UIImage imageNamed:@"icBack"];
            btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(0.f, 0.f, btnImg.size.width, btnImg.size.height);
            [btn setImage:btnImg forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnBackPressed) forControlEvents:UIControlEventTouchUpInside];
            barBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
            self.navigationItem.leftBarButtonItem = barBtnItem;
            
        }
 
        default:
            break;
    }
}



#pragma mark - Action methods


- (void)btnBackPressed{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)btnMorePressed{
    TheApp;
    if([(RESideMenu*)app.window.rootViewController respondsToSelector:@selector(presentLeftMenuViewController)])
        [(RESideMenu*)app.window.rootViewController presentLeftMenuViewController];

}
- (void) btnFilterPressed{
    
}
#pragma mark - RESideMenu Delegate

- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
}


@end
