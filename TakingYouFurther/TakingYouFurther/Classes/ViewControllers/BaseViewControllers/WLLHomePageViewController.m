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
#import "WLLSearchedCollectionViewCell.h"
#import "WLLGuidanceTableViewCell.h"
#import "WLLGuidanceCollectionViewCell.h"
#import "WLLTodayNotesTableViewCell.h"
#import "WLLPopDstinationTableViewCell.h"
#import "WLLPopDestinationCollectionViewCell.h"
#import "WLLRecommendDestinationTableViewCell.h"
#import "WLLRecommendDestinationCollectionViewCell.h"
#import "WLLReviewTableViewCell.h"
#import "WLLHomePageDataManager.h"
#import "WLLGuidanceModel.h"
#import "WLLTodayNotesModel.h"
#import "WLLDestinationModel.h"
#import "WLLRecommendModel.h"
#import "UIImageView+WebCache.h"
#import "WLLPopViewController.h"
#import "WLLSearchViewController.h"
#import "WLLRecommendViewController.h"
#import "WLLMoreOverViewController.h"

#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define kHeight CGRectGetHeight([UIScreen mainScreen].bounds)

@interface WLLHomePageViewController ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, viewSkipDelegate>
{
    UIImageView *headerImage;
    UIView *view_bar;
}

@property (strong, nonatomic) IBOutlet UITableView *homePageTableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *view_barConstraint;
@property (strong, nonatomic) IBOutlet UITextField *searchBar;
@property (nonatomic, strong) WLLPopDstinationTableViewCell *popDTableViewCell;

@end


@implementation WLLHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self assignDelegateAndRegister];
    [self setHeaderView];
    
    [self requestGuidanceData];
    

}

-(void)requestGuidanceData {
    
    [[WLLHomePageDataManager shareInstance] requestHomePageDataWithUrl:kHomePageUrl didFinished:^{
       
        [self.homePageTableView reloadData];
    }];
    
}

-(void)assignDelegateAndRegister{
    
    self.homePageTableView.dataSource = self;
    self.homePageTableView.delegate = self;
    
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLFistTableViewCell" bundle:nil] forCellReuseIdentifier:@"first_cell"];
    
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLSearchedTableViewCell" bundle:nil] forCellReuseIdentifier:@"searched_cell"];
    
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLGuidanceTableViewCell" bundle:nil] forCellReuseIdentifier:@"guidance_cell"];
    
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLTodayNotesTableViewCell" bundle:nil] forCellReuseIdentifier:@"todaynotes_cell"];
    
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLPopDstinationTableViewCell" bundle:nil] forCellReuseIdentifier:@"popdestination_cell"];
    
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLRecommendDestinationTableViewCell" bundle:nil] forCellReuseIdentifier:@"recommend_cell"];
    
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLReviewTableViewCell" bundle:nil] forCellReuseIdentifier:@"review_cell"];
}

#pragma mark - 隐藏自带NavigationBar
-(void)setNaviBarHidden:(BOOL)isHidden {
    
    self.navigationController.navigationBarHidden = isHidden;
}

-(void)viewWillAppear:(BOOL)animated {
    
    [self setNaviBarHidden:YES];
    [self setHeaderView];
    self.view_barConstraint.constant = kHeight/4;
    
    // searchBar 添加左视图
    [self setTextFiledLeftImage:self.searchBar image:@"1"];
    
    WLLPopDstinationTableViewCell *cell = [[WLLPopDstinationTableViewCell alloc] init];
    cell.delegate = self;
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

#pragma mark 
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

#pragma mark number of rows
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

#pragma mark cell For Row At IndexPath
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        WLLFistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first_cell" forIndexPath:indexPath];
        return cell;
    }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
    
        WLLSearchedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searched_cell" forIndexPath:indexPath];
    cell.searchedCollectionView.tag = 101;
    cell.searchedCollectionView.dataSource = self;
    cell.searchedCollectionView.delegate = self;
    
    [cell.searchedCollectionView registerNib:[UINib nibWithNibName:@"WLLSearchedCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"searched_item"];
        return cell;
    }
    
    if (indexPath.section == 0 && indexPath.row == 2) {
    
        WLLGuidanceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"guidance_cell" forIndexPath:indexPath];
        cell.guidanceCollectionView.tag = 102;
        cell.guidanceCollectionView.dataSource = self;
        cell.guidanceCollectionView.delegate = self;
        [cell.guidanceCollectionView registerNib:[UINib nibWithNibName:@"WLLGuidanceCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"guidance_item"];
        [cell.guidanceCollectionView reloadData];
        return cell;
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
    
        WLLTodayNotesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todaynotes_cell" forIndexPath:indexPath];
//        WLLTodayNotesModel *model = [[WLLHomePageDataManager shareInstance] todayNotesModelWithIndex:indexPath.row];
//        cell.model = model;
        return cell;
    }
    
    if (indexPath.section == 2 &&indexPath.row == 0) {
    
        WLLPopDstinationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"popdestination_cell" forIndexPath:indexPath];
        
        cell.popDestinationCollectionView.tag = 103;
        cell.popDestinationCollectionView.delegate = self;
        cell.popDestinationCollectionView.dataSource = self;
//        [cell.popDestinationCollectionView reloadData];
        
        [cell.popDestinationCollectionView registerNib:[UINib nibWithNibName:@"WLLPopDestinationCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"popdestination_item"];
        return cell;
    }
    if (indexPath.section == 3 &&indexPath.row == 0) {
    
        WLLRecommendDestinationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recommend_cell" forIndexPath:indexPath];
        cell.recommendDestinationCollectionView.tag = 104;
        cell.recommendDestinationCollectionView.delegate = self;
        cell.recommendDestinationCollectionView.dataSource = self;
//        [cell.recommendDestinationCollectionView reloadData];
        
        [cell.recommendDestinationCollectionView registerNib:[UINib nibWithNibName:@"WLLRecommendDestinationCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"recommend_item"];
        return cell;
    }
    
    WLLReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"review_cell" forIndexPath:indexPath];
    return cell;

}

#pragma mark height For Row At IndexPath
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80;
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        return 50;
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        return 290;
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
        return 380;
    }
    if (indexPath.section == 2 && indexPath.row == 0) {
        return kWidth * 1.6;
    }
    if (indexPath.section == 3 &&indexPath.row == 0) {
        
        return kWidth * 1.3;
    }
    return kWidth/5;
    
}

#pragma mark - UICollectionView 代理方法

#pragma mark number of items
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//
//    // collectionView 为 searchedCollectionView 时
    if (collectionView.tag == 101) {
//
        return 3;
    }

    // collectionView 为 guidanceCollectionView 时
    if (collectionView.tag == 102) {
        
        return [[WLLHomePageDataManager shareInstance] countOfguidanceArray];
    }
    
    // collectionView 为 popDestinationCollectionView || recommendDestinationCollectionView 时
    if (collectionView.tag == 103 || collectionView.tag == 104) {
//
        return 6;
    }
    return 0;
}

#pragma mark cell for item at indexPath
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // collectionView 为 searchedCollectionView 时
    if (collectionView.tag == 101) {
        WLLSearchedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"searched_item" forIndexPath:indexPath];
        
        cell.layer.masksToBounds = YES;
        cell.layer.cornerRadius = cell.frame.size.height / 2;
        
        return cell;

    }
    // collectionView 为 guidanceCollectionView 时
    if (collectionView.tag == 102) {
    
        WLLGuidanceCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"guidance_item" forIndexPath:indexPath];
        WLLGuidanceModel *model = [[WLLHomePageDataManager shareInstance] guidanceModelWithIdex:indexPath.row];
        cell.model = model;
        return cell;
    }

    // collectionView 为 popDestinationCollectionView 时
    if (collectionView.tag == 103) {

        WLLPopDestinationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"popdestination_item" forIndexPath:indexPath];
        WLLDestinationModel *model = [[WLLHomePageDataManager shareInstance] destinationModelWithIndex:indexPath.row];
        cell.model = model;
        return cell;
    }
    
    // collectionView 为 recommendDestinationCollectionView
    WLLRecommendDestinationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommend_item" forIndexPath:indexPath];
    WLLRecommendModel *model = [[WLLHomePageDataManager shareInstance] recommendModelWithIndex:indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark collection view layout size for item at indexpath
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // collectionView 为 searchedCollectionView 时
    if (collectionView.tag == 101) {
        
        return CGSizeMake(110, 30);
    }
    // collectionView 为 guidanceCollectionView 时
    if (collectionView.tag == 102) {
    
        return CGSizeMake(80, 120);
    }
    // collectionView 为 popDestinationCollectionView 时
    if (collectionView.tag == 103) {

        return CGSizeMake(kWidth/3.5, 250);
    }

    // collectionView 为 recommendDestinationCollectionView
    return CGSizeMake(110, 200);

}

#pragma mark collection view layout inset for section
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // collectionView 为 searchedCollectionView 时
    if (collectionView.tag == 101) {

        return UIEdgeInsetsMake(10, 20, 10, 20);
    }
    // collectionView 为 guidanceCollectionView 时
    if (collectionView.tag == 102) {
    
        return UIEdgeInsetsMake(20, 20, 20, 20);
    }
    
    // collectionView 为 popDestinationCollectionView 时
    if (collectionView.tag == 103) {
    
        return UIEdgeInsetsMake(20, 10, 20, 10);
    }
//
//    // collectionView 为 recommendDestinationCollectionView
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

#pragma mark did Select Item At IndexPath
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView.tag == 103) {
        
        WLLPopViewController *popVC = [[WLLPopViewController alloc] initWithNibName:@"WLLPopViewController" bundle:nil];
        [self.navigationController pushViewController:popVC animated:YES];
    }
    
    if (collectionView.tag == 104) {
        
        WLLRecommendViewController *recommendVC = [[WLLRecommendViewController alloc] initWithNibName:@"WLLRecommendViewController" bundle:nil];
        
        [self.navigationController pushViewController:recommendVC animated:YES];
    }
}

#pragma makr - UIScrollViewDelegate 滚动代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.y > -64 && scrollView.contentOffset.y < 160) {
        
        self.view_barConstraint.constant = 160 - scrollView.contentOffset.y;
    }
    if (scrollView.contentOffset.y < -64) {
        
        self.view_barConstraint.constant = 160 + fabs(scrollView.contentOffset.y);
    }
    if (scrollView.contentOffset.y > 160) {
        
        self.view_barConstraint.constant = 0;
    }

}

-(void)pushViewController {
    
    WLLMoreOverViewController *moreVC = [[WLLMoreOverViewController alloc] initWithNibName:@"WLLMoreOverViewController" bundle:nil];
    
    NSLog(@"11");
    [self.navigationController pushViewController:moreVC animated:YES];
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
