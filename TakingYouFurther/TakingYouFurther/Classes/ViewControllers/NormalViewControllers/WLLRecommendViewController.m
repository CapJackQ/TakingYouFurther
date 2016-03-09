//
//  WLLRecommendViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/5.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLRecommendViewController.h"
#import "WLLRecommendCollectionViewCell.h"
#import "WLLHomePageDataManager.h"
#import "WLLBoracayIslandModel.h"
#import "WLLTodayViewController.h"


#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)

@interface WLLRecommendViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSInteger index;
}

@property (strong, nonatomic) IBOutlet UICollectionView *recommendCollectionView;

@end

@implementation WLLRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.recommendCollectionView.dataSource = self;
    self.recommendCollectionView.delegate = self;
    
    [self.recommendCollectionView registerNib:[UINib nibWithNibName:@"WLLRecommendCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"image_item"];
    [self requestData];
    [self naviBarItem];
}

// 标题头
-(void)naviBarItem {
    if (index == 0) {
        self.navigationItem.title = @"3月当季推荐";
    } else if (index == 1) {
        self.navigationItem.title = @"2月最佳旅行地";
    } else if (index == 2) {
        self.navigationItem.title = @"你好, 1月";
    } else if (index == 3) {
        self.navigationItem.title = @"4月当季推荐--走在春末的季节里";
    } else if (index == 4) {
        self.navigationItem.title = @"5月当季推荐";
    } else if (index == 5) {
        self.navigationItem.title = @"6月当季推荐";
    } else if (index == 6) {
        self.navigationItem.title = @"7月当季推荐";
    } else if (index == 7) {
        self.navigationItem.title = @"最适合8月旅行的目的地";
    } else if (index == 8) {
        self.navigationItem.title = @"最适合9月旅行的目的地";
    } else if (index == 9) {
        self.navigationItem.title = @"最适合10月旅行的目的地";
    } else if (index == 10) {
        self.navigationItem.title = @"最适合当季旅行的目的地";
    } else {
        self.navigationItem.title = @"12月, 我来啦";
    }
}

// 请求数据
-(void)requestData {
    NSArray *array = [WLLHomePageDataManager shareInstance].monthArray;
    index = [WLLHomePageDataManager shareInstance].index;
    
    [[WLLHomePageDataManager shareInstance] requestPopDestinationDataWithUrl:array[index] didFinished:^{
        [self.recommendCollectionView reloadData];
    }];
}

#pragma mark - 显示系统 NavigationBar
-(void)setNaviBarHidden:(BOOL)isHidden {
    self.navigationController.navigationBarHidden = isHidden;
}

-(void)viewWillAppear:(BOOL)animated {
    [self setNaviBarHidden:NO];
}


#pragma mark - UICollectionView Delegate
// 返回cell个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [[WLLHomePageDataManager shareInstance] countOfMonthDataArray];
}

// 返回cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WLLRecommendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"image_item" forIndexPath:indexPath];
    
    WLLBoracayIslandModel *model = [[WLLHomePageDataManager shareInstance] monthModelWithIndex:indexPath.row];
    cell.model = model;

    return cell;
}

// 返回cell 大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(kWidth/2 - 10, kWidth/1.5);
}

// 返回边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

// cell 选中响应
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WLLTodayViewController *todayVC = [[WLLTodayViewController alloc] init];
    todayVC.index = indexPath.row;
    [WLLHomePageDataManager shareInstance].index = indexPath.row;
    
    [self.navigationController pushViewController:todayVC animated:YES];
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
