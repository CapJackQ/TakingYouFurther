//
//  WLLHomePageViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/2/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLHomePageViewController.h"
#import "WLLHomePageUrlHeader.h"
#import "WLLFistTableViewCell.h"
#import "WLLSearchedTableViewCell.h"
#import "WLLGuidanceTableViewCell.h"
#import "WLLTodayNotesTableViewCell.h"
#import "WLLPopDstinationTableViewCell.h"
#import "WLLRecommendDestinationTableViewCell.h"
#import "WLLReviewTableViewCell.h"
#import "WLLHomePageDataManager.h"
#import "WLLTodayNotesModel.h"
#import "UIImageView+WebCache.h"
#import "WLLPopViewController.h"
#import "WLLSearchViewController.h"
#import "WLLRecommendViewController.h"
#import "WLLMoreOverViewController.h"
#import "WLLMoreCheckViewController.h"
#import "WLLSeekViewController.h"
#import "WLLTodayViewController.h"


#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define kHeight CGRectGetHeight([UIScreen mainScreen].bounds)

#define MIN_OFFSET -64

@interface WLLHomePageViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UIImageView *headerImage;
}

@property (strong, nonatomic) IBOutlet UITableView *homePageTableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *view_barConstraint;
@property (strong, nonatomic) IBOutlet UITextField *searchBar;
@property (nonatomic, strong) WLLPopDstinationTableViewCell *popDTableViewCell;

@end


@implementation WLLHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // homePageTableView注册不同cell
    [self assignDelegateAndRegister];
    // 设定顶部图片
    [self setHeaderView];
    
    // 设定导航栏的到顶部的约束距离
    self.view_barConstraint.constant = kHeight/4;
    
    [self registerNotifications];
    
    [[WLLHomePageDataManager shareInstance] requestHomePageDataWithUrl:kHomePageUrl didFinished:^{
        [self.homePageTableView reloadData];
    }];

}

#pragma mark - homePageTableView注册不同cell
-(void)assignDelegateAndRegister {
    
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLFistTableViewCell" bundle:nil]
                 forCellReuseIdentifier:@"first_cell"];
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLSearchedTableViewCell" bundle:nil]
                 forCellReuseIdentifier:@"searched_cell"];
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLGuidanceTableViewCell" bundle:nil]
                 forCellReuseIdentifier:@"guidance_cell"];
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLTodayNotesTableViewCell" bundle:nil]
                 forCellReuseIdentifier:@"todaynotes_cell"];
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLPopDstinationTableViewCell" bundle:nil]
                 forCellReuseIdentifier:@"popdestination_cell"];
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLRecommendDestinationTableViewCell" bundle:nil]
                 forCellReuseIdentifier:@"recommend_cell"];
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLReviewTableViewCell" bundle:nil]
                 forCellReuseIdentifier:@"review_cell"];
}

#pragma mark - 隐藏自带NavigationBar
-(void)setNaviBarHidden:(BOOL)isHidden {
    
    self.navigationController.navigationBarHidden = isHidden;
}

-(void)viewWillAppear:(BOOL)animated {
    
    [self setNaviBarHidden:YES];
    [self setHeaderView];
    // searchBar 添加左视图
    [self setTextFiledLeftImage:self.searchBar image:@"1"];
}

// searchBar 添加左视图
-(void)setTextFiledLeftImage:(UITextField*)textFiled image:(NSString*)image{
    textFiled.leftViewMode = UITextFieldViewModeAlways;
    textFiled.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:image]];
}

#pragma mark - 搜索栏跳转
- (IBAction)searchAction:(UIButton *)sender {
    WLLSearchViewController *searchVC = [[WLLSearchViewController alloc] init];
    [self presentViewController:searchVC animated:YES completion:nil];
}

#pragma mark - 设置头图片
-(void)setHeaderView {
    
    headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight/4)];
//    UIImage *img = [UIImage imageNamed:@"6.jpeg"];
//    CGRect rect = CGRectMake(0, 0, 2000, 400);
    
    [headerImage sd_setImageWithURL:[NSURL URLWithString:@"http://file103.mafengwo.net/s9/M00/40/DF/wKgBs1bHCIiAR7FvAAJImz6CsLI83.jpeg"]];
    
//    CGImageRef imageRef = CGImageCreateWithImageInRect([img CGImage], rect);
    
//    UIImage *image = [UIImage imageWithCGImage:imageRef];
//    [headerImage setImage:image];
    
    self.homePageTableView.tableHeaderView = headerImage;
}

#pragma mark - UITableView 代理方法

// 返回分区个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%ld", [[WLLHomePageDataManager shareInstance] countOfModelArray]);
    return [[WLLHomePageDataManager shareInstance] countOfModelArray]; // 返回model数据重新解析
}

// 返回cell个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 3;
    }
    if (section == 1) {

        return 1;
    }
    if (section == 2) {
        return 1;
    }
    return 2;
}

// 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        WLLFistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first_cell" forIndexPath:indexPath];
        return cell;
    }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
    
        WLLSearchedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searched_cell" forIndexPath:indexPath];
        return cell;
    }
    
    if (indexPath.section == 0 && indexPath.row == 2) {
    
        WLLGuidanceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"guidance_cell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
        WLLTodayNotesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todaynotes_cell" forIndexPath:indexPath];
        WLLTodayNotesModel *model = [[WLLHomePageDataManager shareInstance] todayNotesModelWithIndex:indexPath.row];
        cell.model = model;
        return cell;
    }
    
    if (indexPath.section == 2 && indexPath.row == 0) {
    
        WLLPopDstinationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"popdestination_cell" forIndexPath:indexPath];
        return cell;
    }
    
    if (indexPath.section == 3 && indexPath.row == 0) {
        
        WLLRecommendDestinationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recommend_cell" forIndexPath:indexPath];
        return cell;
    }
    
    WLLReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"review_cell" forIndexPath:indexPath];
    return cell;
}

// 返回cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return kHeight/10.5143;
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        return kWidth/8.28;
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        return kWidth/1.4276;
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
        return kWidth/1.089;
    }
    if (indexPath.section == 2 && indexPath.row == 0) {
        return kWidth * 1.5;
    }
    if (indexPath.section == 3 &&indexPath.row == 0) {
        
        return kWidth * 1.3;
    }
    return kWidth/5;
    
}

// 选中cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1) {
        
        WLLTodayViewController *todayVC = [[WLLTodayViewController alloc] initWithNibName:@"WLLTodayViewController" bundle:nil];
        
        todayVC.index = indexPath.row;
        
        [self.navigationController pushViewController:todayVC animated:YES];
    }
}

#pragma mark - 注册通知
-(void)registerNotifications {
    
    // 注册两个查看按钮消息接受者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(push) name:@"push" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushView) name:@"pushView" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushSeek) name:@"seek" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(popDestination) name:@"seekpop" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushRecommend) name:@"recommend" object:nil];
}

#pragma mark - 推送页面
// 更多热门目的地
-(void)push {
    
    WLLMoreOverViewController *moreVC = [[WLLMoreOverViewController alloc] initWithNibName:@"WLLMoreOverViewController" bundle:nil];
    [self.navigationController pushViewController:moreVC animated:YES];
}
// 更多目的地推荐
-(void)pushView {
    WLLMoreCheckViewController *moreVC = [[WLLMoreCheckViewController alloc] initWithNibName:@"WLLMoreCheckViewController" bundle:nil];
    [self.navigationController pushViewController:moreVC animated:YES];
}

// 找攻略
-(void)pushSeek {
    WLLSeekViewController *seekVC = [[WLLSeekViewController alloc] initWithNibName:@"WLLSeekViewController" bundle:nil];
    [self.navigationController pushViewController:seekVC animated:YES];
}

// 推送目的地
- (void)popDestination {
    WLLPopViewController *popVC = [[WLLPopViewController alloc] initWithNibName:@"WLLPopViewController" bundle:nil];
    [self.navigationController pushViewController:popVC animated:YES];
}

// 推送推荐
-(void)pushRecommend {
    WLLRecommendViewController *recommendVC = [[WLLRecommendViewController alloc] initWithNibName:@"WLLRecommendViewController" bundle:nil];
    [self.navigationController pushViewController:recommendVC animated:YES];
}

#pragma makr - Nvibar 滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.y > MIN_OFFSET && scrollView.contentOffset.y < kHeight/4) {
        self.view_barConstraint.constant = kHeight/4 - scrollView.contentOffset.y - 20;
    }
    if (scrollView.contentOffset.y < MIN_OFFSET) {
        self.view_barConstraint.constant = kHeight/4 + fabs(scrollView.contentOffset.y) - 20;
    }
    if (scrollView.contentOffset.y > kHeight/4) {
        self.view_barConstraint.constant = 0;
    }

}



/*
 - (void)didReceiveMemoryWarning {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }
 
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
