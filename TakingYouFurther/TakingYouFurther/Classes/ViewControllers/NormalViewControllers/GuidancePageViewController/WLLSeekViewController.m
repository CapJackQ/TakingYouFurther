//
//  WLLSeekViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/6.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLSeekViewController.h"

@interface WLLSeekViewController ()

@end

@implementation WLLSeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

// http://mapi.mafengwo.cn/rest/app/mdd/tree/?app_code=cn.mafengwo.www&app_ver=7.4.0&channel_id=App%20Store&device_token=f3935e7a2eab63b6bec5aa672b2acdc6b96b49ee6ad660a9acdf60cd68c4f9f6&device_type=ios&hardware_model=iPhone6%2C1&idfa=E0C0DA4D-42DA-4366-BD40-5C626ABFD012&idfv=0D1C0B58-F9D8-49F3-9EF3-844CE5667F2F&mfwsdk_ver=20131018&oauth_consumer_key=4&oauth_nonce=23946f5f79a197fcb6f90f4c6408236f&oauth_signature=yBcK%2BDjE2FTdYU5u1UG6dJ7KVXg%3D&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1457259804&oauth_token=0_d5af5e71fbcea723b6af2ddae8ab084a&oauth_version=1.0&open_udid=0D1C0B58-F9D8-49F3-9EF3-844CE5667F2F&screen_scale=2&sys_ver=9.2.1&x_auth_mode=client_auth

#pragma mark - 显示系统 NavigationBar
-(void)setNaviBarHidden:(BOOL)isHidden {
    self.navigationController.navigationBarHidden = isHidden;
}

-(void)viewWillAppear:(BOOL)animated {
    [self setNaviBarHidden:NO];
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
