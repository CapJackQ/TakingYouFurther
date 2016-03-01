//
//  WLLUserViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/2/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLUserViewController.h"

@interface WLLUserViewController ()

@end

@implementation WLLUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.parentViewController.navigationItem.title = @"我的";
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingIcon"]
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(leftAction)];
    self.tabBarController.navigationItem.leftBarButtonItem = left;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NotificationIcon"]
                                                              style:UIBarButtonItemStyleDone
                                                             target:self
                                                             action:@selector(rightAction)];
    self.tabBarController.navigationItem.rightBarButtonItem = right;
}

#pragma - mark - 设置和消息按钮

- (void)leftAction {
    
}

- (void)rightAction {
    
}

- (void)viewWillDisappear:(BOOL)animated {
    self.parentViewController.navigationItem.title = nil;
    
    self.tabBarController.navigationItem.leftBarButtonItem = nil;
    
    self.tabBarController.navigationItem.rightBarButtonItem = nil;
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
