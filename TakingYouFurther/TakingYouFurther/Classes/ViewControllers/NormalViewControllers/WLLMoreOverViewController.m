//
//  WLLMoreOverViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/5.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLMoreOverViewController.h"
#import "WLLPopDestinationCollectionViewCell.h"

#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)

@interface WLLMoreOverViewController ()<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *moreOverCollectionVeiw;

@end

@implementation WLLMoreOverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.moreOverCollectionVeiw.dataSource = self;
    self.moreOverCollectionVeiw.delegate = self;
    
    [self.moreOverCollectionVeiw registerNib:[UINib nibWithNibName:@"WLLPopDestinationCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"popdestination_item"];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 11;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WLLPopDestinationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"popdestination_item" forIndexPath:indexPath];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(kWidth/3.5, kWidth/1.656);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
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
