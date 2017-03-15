//
//  SWLoginController.m
//  SWGitHub
//
//  Created by Sergiy Bekker on 15.03.17.
//  Copyright © 2017 SBApps. All rights reserved.
//

#import "SWLoginController.h"
#import "SWWebManager.h"

@interface SWLoginController ()<UITextFieldDelegate>{
    UITextField* activeTextField;
}

@property (nonatomic, weak) IBOutlet UITextField* emailField;
@property (nonatomic, weak) IBOutlet UITextField* passField;
@property (nonatomic, weak) IBOutlet UIButton* doneButton;
@property (nonatomic, weak) IBOutlet UIScrollView* scrollView;

@end

@implementation SWLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    _emailField.leftViewMode = UITextFieldViewModeAlways;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3 * CGRectGetHeight(_emailField.bounds) / 4, CGRectGetHeight(_emailField.bounds))];
    UIImage* image = [UIImage imageNamed:@"icEmail"];
    UIImageView* imgView = [[UIImageView alloc]initWithImage:image];
    [imgView setFrame:CGRectMake(CGRectGetHeight(_emailField.bounds) / 2 - image.size.width / 2, CGRectGetHeight(_emailField.bounds) / 2 - image.size.height / 2, image.size.width, image.size.height)];
    [paddingView addSubview:imgView];
    _emailField.leftView = paddingView;
    _emailField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Эл. почта" attributes:@{NSFontAttributeName : [UIFont fontWithName:FIRASANSREGULAR size:17.f],
                                                                                                             NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    
    
    _passField.leftViewMode = UITextFieldViewModeAlways;
    image = [UIImage imageNamed:@"icPassword"];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3 * CGRectGetHeight(_passField.bounds) / 4, CGRectGetHeight(_passField.bounds))];
    imgView = [[UIImageView alloc]initWithImage:image];
    [imgView setFrame:CGRectMake(CGRectGetHeight(_passField.bounds) / 2 - image.size.width / 2, CGRectGetHeight(_passField.bounds) / 2 - image.size.height / 2, image.size.width, image.size.height)];
    [paddingView addSubview:imgView];
    _passField.leftView = paddingView;
    _passField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Пароль" attributes:@{NSFontAttributeName : [UIFont fontWithName:FIRASANSREGULAR size:17.f],
                                                                                                         NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark - NSNotification  methods


- (void)keyboardWasShown:(NSNotification*)aNotification{
    NSDictionary* info          = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(self.view.frame.origin.x,self.view.frame.origin.y, kbSize.height + 140, 0);
    _scrollView.contentInset          = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    
    [self scrollToActiveTextField:kbSize];
}


- (void)keyboardWillBeHidden:(NSNotification*)aNotification{
    _scrollView.contentInset          = UIEdgeInsetsZero;
    _scrollView.scrollIndicatorInsets = UIEdgeInsetsZero;
}

- (void)scrollToActiveTextField:(CGSize)kbSize{
    
    if (activeTextField){
        CGRect aRect = self.view.frame;
        aRect.size.height -= kbSize.height;
        if (!CGRectContainsPoint(aRect, activeTextField.frame.origin) ) {
            CGPoint scrollPoint = CGPointMake(0.0, activeTextField.frame.origin.y-kbSize.height);
            [_scrollView setContentOffset:scrollPoint animated:YES];
        }
    }
}

#pragma mark - Action methods

- (IBAction)clicked:(id)sender{
    
    UIButton* button = (UIButton*)sender;
    
    TheApp;
    
    if([button isEqual:_doneButton]){
        if([self validateEmail:_emailField.text]){
            [[NSUserDefaults standardUserDefaults] setObject:@{@"login":_emailField.text,
                                                               @"password":_passField.text} forKey:@"userInfo"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            [[SWWebManager sharedManager]loadAuthenticatedUser:^(SWUser *user) {
                if(user != nil){
                    dispatch_async(dispatch_get_main_queue(), ^(){
                        app.window.rootViewController =  [self checkPresentForClassDescriptor:@"MasterController"];
                    });
                }
            }];
        } else {
             [self showAlertMessage:ERRRORLOGIN];
        }
    }
    
}
#pragma mark - UITextField Delegate methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)__textField{
    
    activeTextField = __textField;
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    return  YES;
}
- (BOOL)textField:(UITextField *) __textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    
    
    NSArray *currents = [UITextInputMode activeInputModes];
    UITextInputMode *current = [currents firstObject];
    if ([[current primaryLanguage] isEqualToString:@"emoji"] ) {
        return NO;
    }
    
    BOOL returnKey = YES;
    NSCharacterSet *nameCharSet = [NSCharacterSet characterSetWithCharactersInString:charSet];
    
    if([__textField isEqual:_passField]){
        nameCharSet = [NSCharacterSet characterSetWithCharactersInString:passCharTemplate];
    }  else if([__textField isEqual:_emailField]){
        nameCharSet = [NSCharacterSet characterSetWithCharactersInString:emailCharTemplate];
    }
    
    
    for (int i = 0; i < [string length]; i++){
        unichar c = [string characterAtIndex:i];
        if ([nameCharSet characterIsMember:c]){
            return NO;
        }
    }
    
    NSUInteger oldLength = [__textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_doneButton setUserInteractionEnabled:(![_emailField.text isEqualToString:@""]) && (![_passField.text isEqualToString:@""])];
    });
    
    returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
    return newLength <= 30 || returnKey;
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)_textField{
    
    [_textField resignFirstResponder];
    activeTextField = nil;
    [_doneButton setUserInteractionEnabled:(![_emailField.text isEqualToString:@""]) && (![_passField.text isEqualToString:@""])];
    return  YES;
}

@end
