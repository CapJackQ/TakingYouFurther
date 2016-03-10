//
//  WLLResetPasswordViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/9.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLResetPasswordViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface WLLResetPasswordViewController ()

@end

@implementation WLLResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)sendAnLinkToUser:(UIButton *)sender {
    [AVUser requestPasswordResetForEmailInBackground:self.emailText.text block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"成功");
            
        } else {
            NSLog(@"%@", error);
        }
        [self.navigationController popViewControllerAnimated:YES];
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
