//
//  WLLSearchedTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLSearchedTableViewCell.h"
#import "WLLSearchedCollectionViewCell.h"

#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)

@interface WLLSearchedTableViewCell ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *searchedCollectionView;

@end

@implementation WLLSearchedTableViewCell


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WLLSearchedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"searched_item" forIndexPath:indexPath];
    
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = cell.frame.size.height / 2;
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(kWidth/3.76364, kWidth/13.8);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(kWidth/41.4, kWidth/20.7, kWidth/41.4, kWidth/20.7);
}

- (void)awakeFromNib {
    
    self.searchedCollectionView.dataSource = self;
    self.searchedCollectionView.delegate = self;
    [self.searchedCollectionView registerNib:[UINib nibWithNibName:@"WLLSearchedCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"searched_item"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
