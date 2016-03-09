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
#import "WLLRecommendModel.h"

@interface WLLTodayViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WLLTodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.paginationMode = UIWebPaginationModeTopToBottom;
    
}

-(void)loadTodayNotes {
    
    WLLTodayNotesModel *model = [[WLLHomePageDataManager shareInstance] todayNotesModelWithIndex:self.index];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:model.jump_url]]];
}

-(void)loadRecommend {
    NSInteger path = [WLLHomePageDataManager shareInstance].index;
    switch (path) {
        case 0:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10156"]]];
            break;
        case 1:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10684"]]];
            break;
        case 2:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=13366"]]];
            break;
        case 3:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10128"]]];
            break;
        case 4:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10434"]]];
            break;
        case 5:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10807"]]];
            break;
        case 6:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10208"]]];
            break;
        case 7:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10035"]]];
            break;
        case 8:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10222"]]];
            break;
        case 9:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11045"]]];
            break;
        case 10:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10132"]]];
            break;
        default:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=12594"]]];
            break;
    }

}

-(void)loadPopDest {
    NSInteger path = self.index;
    switch (path) {
        case 0:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10156"]]];
            break;
        case 1:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10684"]]];
            break;
        case 2:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=13366"]]];
            break;
        case 3:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10128"]]];
            break;
        case 4:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10434"]]];
            break;
        case 5:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10807"]]];
            break;
        case 6:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10208"]]];
            break;
        case 7:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10035"]]];
            break;
        case 8:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10222"]]];
            break;
        case 9:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11045"]]];
            break;
        case 10:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10132"]]];
            break;
        default:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=12594"]]];
            break;
    }

    
}

#pragma mark - 显示系统 NavigationBar
-(void)setNaviBarHidden:(BOOL)isHidden {
    self.navigationController.navigationBarHidden = isHidden;
}

-(void)viewWillAppear:(BOOL)animated {
    [self setNaviBarHidden:NO];
    
    NSInteger path = [WLLHomePageDataManager shareInstance].path;
    switch (path) {
        case 0:
            [self loadTodayNotes];
            break;
        case 1:
            [self loadRecommend];
            break;
        case 2:
            [self loadPopDest];
            break;
        default:
            break;
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    [self.webView removeFromSuperview];
}



/*
#pragma mark - Navigation
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
