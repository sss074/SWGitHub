//
//  NSObject+NSObject_CustomFont.h
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NSObject_Custom)

@property (strong, nonatomic) NSString *fontName;
@property (strong, nonatomic) UIFont *font;
@property (assign, nonatomic) CGFloat fontSize;
@property (assign, nonatomic) CGFloat cornerRadius;
@property (assign, nonatomic) UIColor* borderColor;


-(UIFont*) fontFromScreen:(NSArray*)param withFontName:(NSString*)fontName;
- (id)checkPresentForClassDescriptor:(NSString*)objID;
- (void)clearPresentForClassDescriptor;
- (CGSize)sizeWithText:(NSString*)text width:(CGFloat)wdt font:(UIFont*)font;
- (void)showIndecator:(BOOL)state;
-(BOOL)validateEmail:(NSString *) obj;
- (void)showAlertMessage:(NSString*)message;
@end
