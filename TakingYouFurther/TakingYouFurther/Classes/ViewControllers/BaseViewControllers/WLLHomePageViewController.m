//
//  WLLHomePageViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/2/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLHomePageViewController.h"
#import "WLLFistTableViewCell.h"
#import "WLLSearchedTableViewCell.h"
#import "WLLSearchedCollectionViewCell.h"
#import "WLLGuidanceTableViewCell.h"
#import "WLLGuidanceCollectionViewCell.h"
#import "WLLTodayNotesTableViewCell.h"

#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)


@interface WLLHomePageViewController ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
{
    UIImageView *headerImage;
    UIView *view_bar;
}

@property (strong, nonatomic) IBOutlet UITableView *homePageTableView;

@end


@implementation WLLHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homePageTableView.dataSource = self;
    self.homePageTableView.delegate = self;
    
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLFistTableViewCell" bundle:nil] forCellReuseIdentifier:@"first_cell"];
    
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLSearchedTableViewCell" bundle:nil] forCellReuseIdentifier:@"searched_cell"];
    
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLGuidanceTableViewCell" bundle:nil] forCellReuseIdentifier:@"guidance_cell"];
    
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"WLLTodayNotesTableViewCell" bundle:nil] forCellReuseIdentifier:@"todaynotes_cell"];
    
    [self setNavigationBar];
    [self setHeaderView];

}

#pragma mark - 隐藏自带NavigationBar
-(void)setNaviBarHidden:(BOOL)isHidden {
    
    self.navigationController.navigationBarHidden = isHidden;
}

-(void)viewWillAppear:(BOOL)animated {
    
    [self setNaviBarHidden:YES];
    [self setHeaderView];
}

#pragma mark - 自定义NavigationBar
-(UIView *)setNavigationBar {
    
    view_bar = [[UIView alloc] init];
    view_bar.frame=CGRectMake(0, 180, self.view.frame.size.width, 80);
    view_bar.backgroundColor=[UIColor redColor];
    [self.view addSubview:view_bar];
    return view_bar;
}

#pragma mark - 设置头图片
-(void)setHeaderView {
    
    headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 180)];
    UIImage *img = [UIImage imageNamed:@"6.jpeg"];
    CGRect rect = CGRectMake(0, 0, 2000, 400);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([img CGImage], rect);
    
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    [headerImage setImage:image];
    
    self.homePageTableView.tableHeaderView = headerImage;
    
}

#pragma mark - UITableView 代理方法

#pragma mark number of rows
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;
}

#pragma mark cell For Row At IndexPath
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        WLLFistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first_cell" forIndexPath:indexPath];
        return cell;
    }
    
    if (indexPath.row == 1) {
    
        WLLSearchedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searched_cell" forIndexPath:indexPath];
    cell.searchedCollectionView.tag = 101;
    cell.searchedCollectionView.dataSource = self;
    cell.searchedCollectionView.delegate = self;
    
    [cell.searchedCollectionView registerNib:[UINib nibWithNibName:@"WLLSearchedCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"searched_item"];
        return cell;
    }
    
    if (indexPath.row == 2) {
    
        WLLGuidanceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"guidance_cell" forIndexPath:indexPath];
        cell.guidanceCollectionView.tag = 102;
        cell.guidanceCollectionView.dataSource = self;
        cell.guidanceCollectionView.delegate = self;
        [cell.guidanceCollectionView registerNib:[UINib nibWithNibName:@"WLLGuidanceCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"guidance_item"];
        return cell;
    }
//    if (indexPath.row == 3) {
    
        WLLTodayNotesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todaynotes_cell" forIndexPath:indexPath];
        return cell;
//    }

}

#pragma mark height For Row At IndexPath
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 80;
    }
    if (indexPath.row == 1) {
        return 50;
    }
    if (indexPath.row == 2) {
        return 290;
    }
    if (indexPath.row == 3) {
        return 380;
    }
    return 1;
    
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
        
        return 8;
    }
    
//    // collectionView 为 popDestinationCollectionView || recommendDestinationCollectionView 时
//    if ([collectionView isEqual:self.popDestinationCollectionView] || [collectionView isEqual:self.recommendDestinationCollectionView]) {
//        
//        return 6;
//    }
//    
//
//    
    return 0;
}

#pragma mark cell for item at indexPath
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // collectionView 为 searchedCollectionView 时
    if (collectionView.tag == 101) {
        WLLSearchedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"searched_item" forIndexPath:indexPath];
        
        cell.searchedImage.layer.masksToBounds = YES;
        cell.searchedImage.layer.cornerRadius = cell.searchedImage.frame.size.height / 6.2;
        
        cell.layer.masksToBounds = YES;
        cell.layer.cornerRadius = cell.frame.size.height / 2;
        
        cell.searchedLabel.text = @"海螺沟";
        
        return cell;

    }
    // collectionView 为 guidanceCollectionView 时
//    if (collectionView.tag == 102) {
    
        WLLGuidanceCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"guidance_item" forIndexPath:indexPath];
        
        cell.guidanceLabel.text = @"找攻略";
        return cell;
//    }
//
//    // collectionView 为 popDestinationCollectionView 时
//    if ([collectionView isEqual:self.popDestinationCollectionView]) {
//    
//        WLLPopDestinationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:popDestinationStr forIndexPath:indexPath];
//        return cell;
//    }
//    
//    // collectionView 为 recommendDestinationCollectionView
//    WLLRecommendDestinationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:recommendDestinationStr forIndexPath:indexPath];
//    return cell;
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
//    // collectionView 为 popDestinationCollectionView 时
//    if ([collectionView isEqual:self.popDestinationCollectionView]) {
//    
//        return CGSizeMake(115, 240);
//    }
//    
//    // collectionView 为 recommendDestinationCollectionView
//    return CGSizeMake(110, 200);
//
    return CGSizeMake(110, 30);
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
    
//    // collectionView 为 popDestinationCollectionView 时
//    if ([collectionView isEqual:self.popDestinationCollectionView]) {
//    
//        return UIEdgeInsetsMake(20, 20, 20, 20);
//    }
//    
//    // collectionView 为 recommendDestinationCollectionView
    return UIEdgeInsetsMake(20, 20, 20, 20);
}


#pragma makr - UIScrollViewDelegate 滚动代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.y > -64 && scrollView.contentOffset.y < 160) {
        
        view_bar.frame = CGRectMake(0, 160 - scrollView.contentOffset.y, kWidth, 80);
        NSLog(@"1 %f", scrollView.contentOffset.y);
    }
    if (scrollView.contentOffset.y < -64) {
        
        view_bar.frame = CGRectMake(0, 160 + fabs(scrollView.contentOffset.y), kWidth, 64);
        NSLog(@"2 %f", scrollView.contentOffset.y);
    }
    if (scrollView.contentOffset.y > 160) {
        
        view_bar.frame = CGRectMake(0, 0, self.view.frame.size.width, 80);
        NSLog(@"3 %f", scrollView.contentOffset.y);
    }

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
