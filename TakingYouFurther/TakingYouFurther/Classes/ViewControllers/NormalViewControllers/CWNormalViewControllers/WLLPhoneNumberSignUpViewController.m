//
//  WLLPhoneNumberSignUpViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/8.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLPhoneNumberSignUpViewController.h"
#import "WLLUserViewManager.h"

#import <SMS_SDK/SMSSDK.h>
#import <SMS_SDK/Extend/SMSSDKCountryAndAreaCode.h>
#import <SMS_SDK/Extend/SMSSDK+DeprecatedMethods.h>
#import <SMS_SDK/Extend/SMSSDK+ExtexdMethods.h>
#import <MOBFoundation/MOBFoundation.h>


@interface WLLPhoneNumberSignUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;

@property (weak, nonatomic) IBOutlet UITextField *verificationCode;

@property (weak, nonatomic) IBOutlet UITextField *nickName;

@property (weak, nonatomic) IBOutlet UITextField *passWord;

@end

@implementation WLLPhoneNumberSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"手机快速注册";
    
    self.edgesForExtendedLayout = NO;
}

- (IBAction)switchToCipher:(UIButton *)sender {
    
}

- (IBAction)getVerificationCode:(UIButton *)sender {

    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNumber.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (error == nil) {
            NSLog(@"获取验证码成功");
        } else {
            NSLog(@"验证失败");
        }
    }];
}

- (IBAction)signUp:(UIButton *)sender {

    [SMSSDK commitVerificationCode:self.verificationCode.text phoneNumber:self.phoneNumber.text zone:@"86" result:^(NSError *error) {
        if (error == nil) {
            NSLog(@"验证成功");
            AVUser *user = [AVUser user];
            user.username = self.phoneNumber.text;
            user.password = self.passWord.text;
            [user setObject:self.nickName.text forKey:@"nickName"];
            
            [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (error == nil) {
                    NSLog(@"注册成功");
                    [AVUser logInWithUsernameInBackground:self.phoneNumber.text password:self.passWord.text block:^(AVUser *user, NSError *error) {
                        if (error == nil) {
                            NSLog(@"注册成功，并且登陆成功");
                        } else {
                            NSLog(@"%@", error);
                        }
                    }];
                } else {
                    NSLog(@"注册失败%@", error);
                }
            }];
        } else {
            NSLog(@"验证失败");
        }
    }];
}

- (IBAction)toProtocol:(UIButton *)sender {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
