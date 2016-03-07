//
//  WLLGuidanceTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLGuidanceTableViewCell.h"
#import "WLLGuidanceCollectionViewCell.h"
#import "WLLHomePageDataManager.h"
#import "WLLGuidanceModel.h"
#import "WLLHomePageUrlHeader.h"
#import "WLLSeekViewController.h"

#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)

@interface WLLGuidanceTableViewCell ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *guidanceCollectionView;

@end

@implementation WLLGuidanceTableViewCell

- (void)awakeFromNib {

    self.guidanceCollectionView.dataSource = self;
    self.guidanceCollectionView.delegate = self;
    
    [self.guidanceCollectionView registerNib:[UINib nibWithNibName:@"WLLGuidanceCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"guidance_item"];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[WLLHomePageDataManager shareInstance] countOfguidanceArray];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WLLGuidanceCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"guidance_item" forIndexPath:indexPath];
    WLLGuidanceModel *model = [[WLLHomePageDataManager shareInstance] guidanceModelWithIdex:indexPath.row];
    cell.model = model;
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(kWidth/5.175, kWidth/3.45);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section  {
    return UIEdgeInsetsMake(kWidth/20.7, kWidth/20.7, kWidth/20.7, kWidth/20.7);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WLLSeekViewController *seekVC = [[WLLSeekViewController alloc] initWithNibName:@"WLLSeekViewController" bundle:nil];
    seekVC.index = indexPath.row;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(seekAction) name:@"seek" object:@"seekVC"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"seek" object:nil];
    
    
//    [self registerSeekNotification];
}

-(void)registerSeekNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(seekAction) name:@"seek" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"seek" object:nil];
}

-(void)seekAction {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
