//
//  WLLLogInViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLLogInViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import <SMS_SDK/Extend/SMSSDKCountryAndAreaCode.h>
#import <SMS_SDK/Extend/SMSSDK+DeprecatedMethods.h>
#import <SMS_SDK/Extend/SMSSDK+ExtexdMethods.h>
#import <MOBFoundation/MOBFoundation.h>


@interface WLLLogInViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trailingContraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonTwoLeadingContraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonThreeTrailingContraint;

@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segement;
@property (weak, nonatomic) IBOutlet UIView *phoneVerify;
@property (weak, nonatomic) IBOutlet UIView *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberIdentifyTextField;
@property (weak, nonatomic) IBOutlet UIButton *phoneLogInButton;

@end

@implementation WLLLogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"无限视觉";
    
    
    CGFloat screenWidth = self.view.frame.size.width;
    CGFloat trailingWidth = self.trailingContraint.constant;
    CGFloat buttonWidth = self.buttonOne.frame.size.width;
    CGFloat constantSpace = (screenWidth - 2 * trailingWidth - 4 * buttonWidth) / 3;
    
    self.buttonTwo.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonTwoLeadingContraint.constant = constantSpace;
    self.buttonTwoLeadingContraint.active = YES;
    
    self.buttonThree.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonThreeTrailingContraint.constant = constantSpace;
    self.buttonThreeTrailingContraint.active = YES;
    
    //是view从(0, 64)开始
    self.edgesForExtendedLayout = NO;
    
    //设置边框width和颜色
    self.logInButton.layer.borderWidth = 2.0;
    self.logInButton.layer.borderColor = [UIColor greenColor].CGColor;
    
    self.phoneLogInButton.layer.borderWidth = 2.0;
    self.phoneLogInButton.layer.borderColor = [UIColor greenColor].CGColor;
    
   
    self.accountTextField.layer.borderWidth = 1.0;
    self.accountTextField.layer.borderColor = [UIColor grayColor].CGColor;
    self.accountTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.passWordTextField.layer.borderWidth = 1.0;
    self.passWordTextField.layer.borderColor = [UIColor grayColor].CGColor;
    self.passWordTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.segement.selectedSegmentIndex = 0;
    [self.segement addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    self.phoneVerify.hidden = YES;
    
    self.phoneNumberTextField.layer.borderWidth = 1.0;
    self.phoneNumberTextField.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.phoneNumberIdentifyTextField.layer.borderWidth = 1.0;
    self.phoneNumberIdentifyTextField.layer.borderColor = [UIColor grayColor].CGColor;
    // Do any additional setup after loading the view from its nib.
}


#pragma mark - 切换登陆方式的方法

- (void)switchAction:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0: {
            self.phoneVerify.hidden = YES;
            break;
        }
        case 1: {
            self.phoneVerify.hidden = NO;
            break;
        }
        default:
            break;
    }
}


#pragma mark - 手机验证登陆方法

- (IBAction)sendVerificationCode:(UIButton *)sender {
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNumberTextField.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (error == nil) {
            NSLog(@"获取验证码成功");
        } else {
            NSLog(@"获取验证码失败");
        }
    }];
}
- (IBAction)phoneNumberLogIn:(UIButton *)sender {
    [SMSSDK commitVerificationCode:self.phoneNumberIdentifyTextField.text phoneNumber:self.phoneNumberTextField.text zone:@"86" result:^(NSError *error) {
        if (error == nil) {

            [self.navigationController popViewControllerAnimated:YES];
//            NSString *passWord = [NSString stringWithFormat:@"%d", arc4random() % 1000000];
//            NSString *str = [NSString stringWithFormat:@"电话号码: %@/n 密码: %@", self.phoneNumberTextField.text, passWord];
//            [SMSSDK sendSMS:self.phoneNumberTextField.text AndMessage:str];
        } else {
            
        }
    }];
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
