//
//  DestinationDetailViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/5.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "DestinationDetailViewController.h"
#import "DestinationHeader.h"
#import "TabImageView.h"
@interface DestinationDetailViewController ()

@end

@implementation DestinationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    for (id cc in self.navigationController.navigationBar.subviews) {
        if ([cc isKindOfClass:[UISearchBar class]]) {
            [cc removeFromSuperview];
        }
    }
    
    TabImageView *tabImgView = [[TabImageView alloc] initWithFrame:CGRectMake(0, 0, SWidth, 95)];
    tabImgView.image = [UIImage imageNamed:@"tabPro"];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.scalesPageToFit = YES;
    webView.dataDetectorTypes = UIDataDetectorTypeAll;
    [webView.scrollView addSubview:tabImgView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.jumpUrl]]];
    [self.view addSubview:webView];
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)backAction {
    self.jumpblock(NO);
    [self.navigationController popViewControllerAnimated:YES];
    
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
