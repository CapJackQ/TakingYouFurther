//
//  WLLMoreCheckViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/6.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLMoreCheckViewController.h"
#import "WLLRecommendDestinationCollectionViewCell.h"
#import "WLLMoreCheckModel.h"
#import "WLLHomePageDataManager.h"
#import "WLLHomePageUrlHeader.h"

@interface WLLMoreCheckViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *moreCheckCollectionView;

@end

@implementation WLLMoreCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.moreCheckCollectionView.dataSource = self;
    self.moreCheckCollectionView.delegate = self;
    
    [self.moreCheckCollectionView registerNib:[UINib nibWithNibName:@"WLLRecommendDestinationCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"recommend_item"];
    
    [[WLLHomePageDataManager shareInstance] requestMoreCheckDataWithUrl:kMoreCheckUrl finished:^{
        [self.moreCheckCollectionView reloadData];
    }];
}

#pragma mark - 显示系统 NavigationBar
-(void)setNaviBarHidden:(BOOL)isHidden {
    self.navigationController.navigationBarHidden = isHidden;
}

-(void)viewWillAppear:(BOOL)animated {
    [self setNaviBarHidden:NO];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [[WLLHomePageDataManager shareInstance] countOfMoreCheckArray];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WLLRecommendDestinationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommend_item" forIndexPath:indexPath];
    
    WLLMoreCheckModel *model = [[WLLHomePageDataManager shareInstance] moreCheckModelWithIdex:indexPath.row];
    cell.Mmodel = model;
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(110, 200);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20, 20, 20, 20);
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
