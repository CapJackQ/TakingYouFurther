//
//  WLLPopDstinationTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLPopDstinationTableViewCell.h"
#import "WLLDestinationModel.h"
#import "WLLHomePageDataManager.h"
#import "WLLPopDestinationCollectionViewCell.h"
#import "WLLHomePageUrlHeader.h"
#import "WLLPopViewController.h"

#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)


@interface WLLPopDstinationTableViewCell () <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *popDestinationCollectionView;
@end

@implementation WLLPopDstinationTableViewCell


#pragma mark - awake From Nib
- (void)awakeFromNib {
    // Initialization code
    self.popDestinationCollectionView.dataSource = self;
    self.popDestinationCollectionView.delegate = self;
    
    [self.popDestinationCollectionView registerNib:[UINib nibWithNibName:@"WLLPopDestinationCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"popdestination_item"];
    
}

#pragma mark - UICollectionViewCell Delegate

// 返回个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[WLLHomePageDataManager shareInstance] countOfDestinationArray];
}

// 返回cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WLLPopDestinationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"popdestination_item" forIndexPath:indexPath];
    WLLDestinationModel *model = [[WLLHomePageDataManager shareInstance] destinationModelWithIndex:indexPath.row];
    cell.model = model;
    return cell;
}

// 返回cell尺寸
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(kWidth/3.4, kWidth/1.656);
}

// 返回cell边缘距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(kWidth/20.7, kWidth/41.4, kWidth/20.7, kWidth/41.4);
}

// cell点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [WLLHomePageDataManager shareInstance].path = 2;
    [WLLHomePageDataManager shareInstance].month = indexPath.row;
    
    [self registerNotification];
}

// 注册通知
-(void)registerNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action) name:@"seekpop" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"seekpop" object:nil];
}

#pragma mark - 查看更多按钮点击事件
- (IBAction)moreCheckAction:(UIButton *)sender {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action) name:@"push" object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"push" object:nil];
}
-(void)action {
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
