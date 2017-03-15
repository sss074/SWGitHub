//
//  AppConstants.h
//  Lookshop
//
//  Created by Sergiy on 02.02.17.
//  Copyright © 2017 Legendary-apps. All rights reserved.
//

#ifndef AppConstants_h
#define AppConstants_h


#define PERSONAL_ACCESS_TOKEN @"PUT_YOUR_ACCESS_TOKEN"
#define TheApp AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate]

static NSString * const kDevBaseApiUrl  =  @"https://api.github.com";
static NSString *charSet = @"_.-/:;()&@\",?!'[]{}#%^*+=\\|~<>₽$£₹€•´`";
static NSString *passCharTemplate = @"/:;()&@\",?!'[]{}#%^*+=\\|~<>₽$£₹€•";
static NSString *emailCharTemplate = @" /:;()&\",?!'[]{}#%^*+=\\|~<>₽$£₹€•";

typedef NS_ENUM(NSUInteger, NavBarType) {
    BASETYPE = 0,
    MENUTYPE,
    BACKTYPE,
    FILTERTYPE,
    FILTERCHECKTYPE
};


#endif /* AppConstants_h */
