//
//  NSObject+NSObject_CustomFont.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "NSObject+NSObject_Custom.h"
#import <SDVersion/SDVersion.h>
#import "DGActivityIndicatorView.h"

static NSMapTable *requestClasses = nil;
static dispatch_once_t onceToken;
static DGActivityIndicatorView *viewButton;
static UIWindow *window;

@implementation NSObject (NSObject_Custom)

@dynamic font,fontSize,cornerRadius,borderColor;



- (NSString *)fontName
{
    return self.font.fontName;
}

- (void)setFontName:(NSString *)fontName
{
    self.font = [UIFont fontWithName:fontName size:self.font.pointSize];
}
- (void)setFontSize:(CGFloat)fontSize{
    CGFloat sizeFont = fontSize;
    DeviceSize size = [SDiOSVersion deviceSize];
    if(size == Screen4inch || size == Screen3Dot5inch)
        sizeFont -= 2.f;

    self.font = [UIFont fontWithName:self.font.fontName size:sizeFont];

    
}
- (void)setCornerRadius:(CGFloat)cornerRadius{
    
    CALayer* l = [(UIView*)self layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:cornerRadius];
}
- (void)setBorderColor:(UIColor *)borderColor{
    [[(UIView*)self layer]setBorderWidth:0.7];
    [(UIView*)self layer].borderColor = borderColor.CGColor;
}
-(UIFont*) fontFromScreen:(NSArray*)param withFontName:(NSString*)fontName{
    
    CGFloat pointSize = 18.f;
    
    if(param != nil){
        DeviceSize size = [SDiOSVersion deviceSize];
        if(param.count == 3){
            if(size == Screen5Dot5inch){
                pointSize = ((NSNumber*)param[0]).floatValue;
            } else if(size == Screen4Dot7inch){
                pointSize = ((NSNumber*)param[1]).floatValue;
            }else if(size == Screen4inch || size == Screen3Dot5inch){
                pointSize = ((NSNumber*)param[2]).floatValue;
            }
        }
    }
    
    return  [UIFont fontWithName:fontName size:pointSize];;
}

- (void)clearPresentForClassDescriptor{
    [requestClasses removeAllObjects];
}
- (id)checkPresentForClassDescriptor:(NSString*)objID{
    
    if(objID == nil)
        return nil;

    dispatch_once(&onceToken, ^{
        requestClasses = [NSMapTable weakToStrongObjectsMapTable];
    });
    
    if ([requestClasses objectForKey:objID]) {
       return [requestClasses objectForKey:objID];
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    id Obj = [storyboard instantiateViewControllerWithIdentifier:objID];
    [requestClasses setObject:Obj forKey:objID];
    
    return Obj;
}
- (CGSize)sizeWithText:(NSString*)text width:(CGFloat)wdt font:(UIFont*)font{
    CGSize maximumLabelSize = CGSizeMake(wdt, FLT_MAX);
    CGRect rectbut = [text boundingRectWithSize:maximumLabelSize
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName : font}
                                        context:nil];
    
    
    return rectbut.size;
}
- (void)showIndecator:(BOOL)state{
    
    [viewButton stopAnimating];
    [viewButton removeFromSuperview];
    window.hidden = YES;
    window = nil;
    
    if(state){
        
        
        window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
        window.windowLevel = UIWindowLevelAlert + 1.0;
        window.backgroundColor = [UIColor clearColor];
        [window makeKeyAndVisible];
        
        
        CGRect frame= [[UIScreen mainScreen]bounds];
        
        viewButton =  [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallSpinFadeLoader tintColor:[UIColor colorWithRed:11.f/255.f green:13.f/255.f blue:13.f/255.f alpha:1.f] size:50.0f];
        
        viewButton.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
                                       UIViewAutoresizingFlexibleBottomMargin |
                                       UIViewAutoresizingFlexibleLeftMargin |
                                       UIViewAutoresizingFlexibleRightMargin);
        viewButton.frame = CGRectMake(frame.size.width / 2 - 25.f, frame.size.height / 2 - 110.f, 50.0f, 50.0f);
        [window addSubview:viewButton];
        [window bringSubviewToFront:viewButton];
        [viewButton startAnimating];
    }
}

@end
