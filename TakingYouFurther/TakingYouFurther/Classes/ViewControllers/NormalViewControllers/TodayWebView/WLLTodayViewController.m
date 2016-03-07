//
//  WLLTodayViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/7.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLTodayViewController.h"
#import "WLLHomePageDataManager.h"
#import "WLLTodayNotesModel.h"

@interface WLLTodayViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WLLTodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WLLTodayNotesModel *model = [[WLLHomePageDataManager shareInstance] todayNotesModelWithIndex:self.index];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:model.jump_url]]];
    
    self.webView.paginationMode = UIWebPaginationModeTopToBottom;
    
}


//#pragma mark - 显示系统 NavigationBar
//-(void)setNaviBarHidden:(BOOL)isHidden {
//    self.navigationController.navigationBarHidden = isHidden;
//}
//
//-(void)viewWillAppear:(BOOL)animated {
//    [self setNaviBarHidden:NO];
//}

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
