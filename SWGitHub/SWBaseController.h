//
//  ViewController.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

@interface SWBaseController : UIViewController


- (void)btnBackPressed;
- (void)btnMorePressed;
- (void)setupNavBtn:(NavBarType)type;


@end

