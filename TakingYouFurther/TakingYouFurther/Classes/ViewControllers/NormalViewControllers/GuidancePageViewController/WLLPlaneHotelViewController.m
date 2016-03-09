//
//  WLLPlaneHotelViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/9.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLPlaneHotelViewController.h"
#import "WLLHomePageViewController.h"
#import "WLLLoopTableViewCell.h"
#import "WLLDeatinationTableViewCell.h"

@interface WLLPlaneHotelViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UISearchBar *seachBar;
@property (strong, nonatomic) IBOutlet UIView *naviBarView;

@end

@implementation WLLPlaneHotelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"WLLLoopTableViewCell" bundle:nil] forCellReuseIdentifier:@"loop_cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"WLLDeatinationTableViewCell" bundle:nil] forCellReuseIdentifier:@"seg_cell"];
}
- (IBAction)backToLastView:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        WLLLoopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"loop_cell" forIndexPath:indexPath];
        return cell;
    }
    WLLDeatinationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"seg_cell" forIndexPath:indexPath];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 100;
    }
    if (indexPath.row == 1) {
        return 200;
    }
    return 120;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%f", scrollView.contentOffset.y);
//    if (scrollView.contentOffset.y > 0) {
//        
//        self.titleLabel.frame = CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y, self.titleLabel.frame.size.width / scrollView.contentOffset.y, self.titleLabel.frame.size.height/ scrollView.contentOffset.y);
//    } else if (scrollView.contentOffset.y < 0) {
//        self.titleLabel.frame = CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
//    }
}


/*
#pragma mark - Navigation
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
