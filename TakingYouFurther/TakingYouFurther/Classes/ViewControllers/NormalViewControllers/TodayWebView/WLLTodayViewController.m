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
#import "Model.h"


#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define kHeight CGRectGetHeight([UIScreen mainScreen].bounds)

@interface WLLTodayViewController ()
{
    UIImageView *navi;
}
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WLLTodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.paginationMode = UIWebPaginationModeTopToBottom;
    navi = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/7.7471)];
    navi.image = [UIImage imageNamed:@"navi"];
    [self.webView.scrollView addSubview:navi];
    
}

-(void)loadTodayNotes {
    
    WLLTodayNotesModel *model = [[WLLHomePageDataManager shareInstance] todayNotesModelWithIndex:self.index];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:model.jump_url]]];
}

// 加载热门推荐 目的地
-(void)loadRecommend {
    NSInteger path = [WLLHomePageDataManager shareInstance].index;
    NSInteger month = [WLLHomePageDataManager shareInstance].month;
    // 3月
    if (month == 0) {
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
    // 2月
    if (month == 1) {
        switch (path) {
            case 0:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10487"]]];
                break;
            case 1:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10381"]]];
                break;
            case 2:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10088"]]];
                break;
            case 3:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10127"]]];
                break;
            case 4:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10030"]]];
                break;
            case 5:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10206"]]];
                break;
            case 6:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10035"]]];
                break;
            case 7:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10065"]]];
                break;
            case 8:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10189"]]];
                break;
            case 9:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=12684"]]];
                break;
            case 10:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=15284"]]];
                break;
            case 11:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=15911"]]];
                break;
            case 12:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11047"]]];
                break;
            default:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10746"]]];
                break;
        }
    }
    // 1月
    if (month == 2) {
        switch (path) {
            case 0:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10030"]]];
                break;
            case 1:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11327"]]];
                break;
            case 2:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10068"]]];
                break;
            case 3:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10754"]]];
                break;
            case 4:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10544"]]];
                break;
            case 5:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10202"]]];
                break;
            case 6:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10746"]]];
                break;
            case 7:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10070"]]];
                break;
            case 8:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=12684"]]];
                break;
            case 9:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10083"]]];
                break;
            case 10:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11058"]]];
                break;
            case 11:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=14383"]]];
                break;
        }
    }
    // 4月
    if (month == 3) {
        switch (path) {
            case 0:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=12491"]]];
                break;
            case 1:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10403"]]];
                break;
            case 2:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10136"]]];
                break;
            case 3:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10155"]]];
                break;
            case 4:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11030"]]];
                break;
            case 5:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10094"]]];
                break;
            case 6:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10045"]]];
                break;
            case 7:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10440"]]];
                break;
            case 8:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10434"]]];
                break;
            case 9:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10132"]]];
                break;
            case 10:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10809"]]];
                break;
            case 11:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=15284"]]];
                break;
        }
    }
    // 5月
    if (month == 4) {
        switch (path) {
            case 0:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10089"]]];
                break;
            case 1:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=12788"]]];
                break;
            case 2:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=110121"]]];
                break;
            case 3:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11045"]]];
                break;
            case 4:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11047"]]];
                break;
            case 5:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10442"]]];
                break;
            case 6:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10067"]]];
                break;
            case 7:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10130"]]];
                break;
            case 8:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10053"]]];
                break;
            case 9:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10482"]]];
                break;
            case 10:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10095"]]];
                break;
            case 11:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10189"]]];
                break;
            case 12:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10444"]]];
                break;
            case 13:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10547"]]];
                break;
        }
    }
    // 6月
    if (month == 5) {
        switch (path) {
            case 0:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11030"]]];
                break;
            case 1:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10053"]]];
                break;
            case 2:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=17211"]]];
                break;
            case 3:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10076"]]];
                break;
            case 4:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10521"]]];
                break;
            case 5:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10240"]]];
                break;
            case 6:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10057"]]];
                break;
            case 7:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10564"]]];
                break;
            case 8:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11630"]]];
                break;
            case 9:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=13061"]]];
                break;
            case 10:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10754"]]];
                break;
            case 11:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10489"]]];
                break;
            case 12:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10172"]]];
                break;
            case 13:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11119"]]];
                break;
            case 14:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10047"]]];
                break;
            case 15:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11078"]]];
                break;
        }
    }
    // 7月
    if (month == 6) {
        switch (path) {
            case 0:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10134"]]];
                break;
            case 1:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10301"]]];
                break;
            case 2:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10034"]]];
                break;
            case 3:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10180"]]];
                break;
            case 4:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10927"]]];
                break;
            case 5:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11047"]]];
                break;
            case 6:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11469"]]];
                break;
            case 7:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10162"]]];
                break;
            case 8:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10460"]]];
                break;
            case 9:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=10011"]]];
                break;
            case 10:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11091"]]];
                break;
            case 11:
                [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/nb/public/sharejump.php?type=10&id=11471"]]];
                break;
        }
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
        case 3:
            [self loadReview];
            break;
        case 4:
            [self loadGuidance];
        default:
            
            break;
    }
}

// 加载往期回顾
-(void)loadReview {
    Model *model = [[WLLHomePageDataManager shareInstance] modelWithIndex:0];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.jump_url]]]];
}


// 引导页
-(void)loadGuidance {
    self.index = [WLLHomePageDataManager shareInstance].index;
    switch (self.index) {
        case 0:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/mdd/"]]];
            break;
        case 1:
//            navi.hidden = YES;
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/hotel/"]]];
            break;
        case 2:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/hotel/"]]];
            break;
        case 3:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/localdeals/?cid=1010402"]]];
            break;
        case 4:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/note.php"]]];
            break;
        case 5:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/weng/now.php"]]];
            break;
        case 6:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.mafengwo.cn/wenda/"]]];
            break;
        default:
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://visa.mafengwo.cn"]]];
            break;
    }
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
