//
//  AppConstants.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#ifndef AppConstants_h
#define AppConstants_h

#define ERRRORLOGIN @"Неверный логин или пароль"
#define REPOTITLE @"Мои репозитории"
#define SEARCHTITLE @"Поиск"
#define EXITTITLE @"Выйти из аккаунта"


#define TheApp AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate]
#define  FIRASANSMEDIUM @"FiraSans-Medium"
#define  FIRASANSREGULAR @"FiraSans-Regular"

static NSString * const kDevBaseApiUrl  =  @"https://api.github.com";
static NSString *charSet = @"_.-/:;()&@\",?!'[]{}#%^*+=\\|~<>₽$£₹€•´`";
static NSString *passCharTemplate = @"/:;()&@\",?!'[]{}#%^*+=\\|~<>₽$£₹€•";
static NSString *emailCharTemplate = @" /:;()&\",?!'[]{}#%^*+=\\|~<>₽$£₹€•";

typedef NS_ENUM(NSUInteger, NavBarType) {
    BASETYPE = 0,
    BACKTYPE,
};


#endif /* AppConstants_h */
