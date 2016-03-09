//
//  WLLDeatinationTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/9.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLDeatinationTableViewCell.h"

#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)

#define SEG_OFFSET scrollView.contentOffset.x / kWidth

@interface WLLDeatinationTableViewCell ()<UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *firstCollection;
@property (strong, nonatomic) IBOutlet UICollectionView *secCollection;
@property (strong, nonatomic) IBOutlet UICollectionView *thirdCollection;
@property (strong, nonatomic) IBOutlet UICollectionView *fourthCollection;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment;

@end

@implementation WLLDeatinationTableViewCell
- (IBAction)segmentControl:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0: {
            [UIView animateWithDuration:0.5 animations:^{
                self.scrollView.contentOffset = CGPointMake(0, 0);
            }];
            break;
        }
        case 1: {
            [UIView animateWithDuration:0.5 animations:^{
                self.scrollView.contentOffset = CGPointMake(kWidth, 0);
            }];
            break;
        }
        case 2: {
            [UIView animateWithDuration:0.5 animations:^{
                self.scrollView.contentOffset = CGPointMake(2*kWidth, 0);
            }];
            break;
        }
        default:
            [UIView animateWithDuration:0.5 animations:^{
                self.scrollView.contentOffset = CGPointMake(3*kWidth, 0);
            }];
            break;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger offSet = SEG_OFFSET;
    
    switch (offSet) {
        case 0:
            self.segment.selectedSegmentIndex = 0;
            break;
        case 1:
            self.segment.selectedSegmentIndex = 1;
            break;
        case 2:
            self.segment.selectedSegmentIndex = 2;
            break;
        default:
            self.segment.selectedSegmentIndex = 3;
            break;
    }
}

- (void)awakeFromNib {
    self.scrollView.delegate = self;
    [self.firstCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"first_item"];
    [self.secCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"sec_item"];
    [self.thirdCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"third_item"];
    [self.fourthCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"fourth_item"];
    
    self.firstCollection.delegate = self;
    self.firstCollection.dataSource = self;
    
    self.secCollection.dataSource = self;
    self.secCollection.delegate = self;
    
    self.thirdCollection.dataSource = self;
    self.thirdCollection.delegate = self;
    
    self.fourthCollection.dataSource = self;
    self.fourthCollection.delegate = self;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([collectionView isEqual:self.firstCollection]) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"first_item" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    if ([collectionView isEqual:self.secCollection]) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"sec_item" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor cyanColor];
        return cell;
    }
    if ([collectionView isEqual:self.thirdCollection]) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"third_item" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor purpleColor];
        return cell;
    }
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"fourth_item" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(110, 35);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(15, 20, 15, 20);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
