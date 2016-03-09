//
//  WLLRecommendDestinationTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLRecommendDestinationTableViewCell.h"
#import "WLLRecommendDestinationCollectionViewCell.h"
#import "WLLHomePageDataManager.h"
#import "WLLRecommendModel.h"
#import "WLLRecommendViewController.h"

#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)

@interface WLLRecommendDestinationTableViewCell () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UILabel *recommendLabel;

@property (strong, nonatomic) IBOutlet UICollectionView *recommendDestinationCollectionView;

@end

@implementation WLLRecommendDestinationTableViewCell

- (void)awakeFromNib {
    
    self.recommendDestinationCollectionView.dataSource = self;
    self.recommendDestinationCollectionView.delegate = self;
    
    [self.recommendDestinationCollectionView registerNib:[UINib nibWithNibName:@"WLLRecommendDestinationCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"recommend_item"];
}

#pragma mark - UICollectionViewCell Delegate

// 返回cell个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[WLLHomePageDataManager shareInstance] countOfDestinationArray];
}

// 返回cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WLLRecommendDestinationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommend_item" forIndexPath:indexPath];
    WLLRecommendModel *model = [[WLLHomePageDataManager shareInstance] recommendModelWithIndex:indexPath.row];
    cell.model = model;
    return cell;
}

// 返回边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(kWidth/20.7, kWidth/41.4, kWidth/20.7, kWidth/41.4);
}

// 返回cell尺寸
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(kWidth/3.76364, kWidth/2.07);
}

// 选中cell响应事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [WLLHomePageDataManager shareInstance].path = 1;
    [WLLHomePageDataManager shareInstance].index = indexPath.row;
    NSLog(@"00 %ld",[WLLHomePageDataManager shareInstance].index);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action) name:@"recommend" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"recommend" object:nil];
}


#pragma mark -
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 查看更多按钮响应事件
- (IBAction)pushView:(UIButton *)sender {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action) name:@"pushView" object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pushView" object:nil];
}

-(void)action {
    
}

@end
