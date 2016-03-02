//
//  WLLHomePageViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/2/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLHomePageViewController.h"
#import "WLLSearchedCollectionViewCell.h"
#import "WLLGuidanceCollectionViewCell.h"

@interface WLLHomePageViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

// 搜索内容
@property (strong, nonatomic) IBOutlet UICollectionView *searchedCollectionView;
// 导引栏
@property (strong, nonatomic) IBOutlet UICollectionView *guidanceCollectionView;

@end

static NSString *searchedStr = @"searched_item";
static NSString *guidanceStr = @"guidance_item";

@implementation WLLHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 设置 collectionViewView 代理
    self.searchedCollectionView.dataSource = self;
    self.searchedCollectionView.delegate = self;
    
    // 注册 searchedCollectionView
    [self.searchedCollectionView registerNib:[UINib nibWithNibName:@"WLLSearchedCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:searchedStr];
    
    // 设置 guidanceCollectionView 代理
    self.guidanceCollectionView.dataSource = self;
    self.guidanceCollectionView.delegate = self;
    
    // 注册 guidanceCollectionView
    [self.guidanceCollectionView registerNib:[UINib nibWithNibName:@"WLLGuidanceCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:guidanceStr];

    
    
}

#pragma mark - UICollectionViewCell 代理方法

#pragma mark number of items
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    // collectionView 为 searchedCollectionView 时
    if ([collectionView isEqual:self.searchedCollectionView]) {
        
        return 3;
    }
    
    // collectionView 为 guidanceCollectionView 时
    if ([collectionView isEqual:self.guidanceCollectionView]) {
        
        return 8;
    }
    return 0;
}

#pragma mark cell for item at indexPath
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // collectionView 为 searchedCollectionView 时
    if ([collectionView isEqual:self.searchedCollectionView]) {
        WLLSearchedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:searchedStr forIndexPath:indexPath];
        
        cell.searchedImage.layer.masksToBounds = YES;
        cell.searchedImage.layer.cornerRadius = cell.searchedImage.frame.size.height / 6.2;
        
        cell.layer.masksToBounds = YES;
        cell.layer.cornerRadius = cell.frame.size.height / 2;
        
        cell.searchedLabel.text = @"海螺沟";
        
        return cell;

    }
    // collectionView 为 guidanceCollectionView 时
//    if ([collectionView isEqual:self.guidanceCollectionView]) {
    
        WLLGuidanceCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:guidanceStr forIndexPath:indexPath];
        
        cell.guidanceLabel.text = @"找攻略";
        return cell;
//    }
}

#pragma mark collection view layout size for item at indexpath
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // collectionView 为 searchedCollectionView 时
    if ([collectionView isEqual:self.searchedCollectionView]) {
        
        return CGSizeMake(110, 30);
    }
    // collectionView 为 guidanceCollectionView 时
//    if ([collectionView isEqual:self.guidanceCollectionView]) {
    
        return CGSizeMake(80, 100);
//    }
}

#pragma mark 
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // collectionView 为 searchedCollectionView 时
    if ([collectionView isEqual:self.searchedCollectionView]) {
        
        return UIEdgeInsetsMake(18, 20, 10, 20);
    }
    // collectionView 为 guidanceCollectionView 时
    //    if ([collectionView isEqual:self.guidanceCollectionView]) {
    
    return UIEdgeInsetsMake(32, 20, 10, 20);
    //    }

    
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
