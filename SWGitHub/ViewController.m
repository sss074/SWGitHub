//
//  ViewController.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "ViewController.h"
#import "SWWebManager.h"
#import "SWUser.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
 

    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    __block SWWebManager* manager = [SWWebManager new];
//    [manager loadAuthenticatedUser:^(SWUser *result) {
//        NSLog(@"%@", result);
//     
//    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        manager = [SWWebManager new];
        [manager searchRepositoriesUser:@"restkit"
           complition:^(NSArray<SWRepository *> *result) {
               NSLog(@"%@", result);
               
           }];
    });
         
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
         manager = [SWWebManager new];
           [manager repositoriesUser:^(NSArray<SWRepository *> *result){
               NSLog(@"%@", result);
           }];
             
        });
}

@end
