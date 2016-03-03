//
//  WLLMyDownloadViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLMyDownloadViewController.h"

@interface WLLMyDownloadViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *travelNoteTableView;
@property (weak, nonatomic) IBOutlet UITableView *strategyTableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *switchSegment;

@end

@implementation WLLMyDownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = NO;
    
    //创建、并添加搜索bar
    CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    UISearchBar *travelNoteSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 30)];
    travelNoteSearchBar.placeholder = @"搜索已下载游记";
    travelNoteSearchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.travelNoteTableView.tableHeaderView = travelNoteSearchBar;
    
    UISearchBar *strategySearchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 30)];
    strategySearchbar.placeholder = @"搜索已下载攻略";
    strategySearchbar.searchBarStyle = UISearchBarStyleMinimal;
    self.strategyTableView.tableHeaderView = strategySearchbar;
    
    [self.switchSegment addTarget:self action:@selector(switchSegment:) forControlEvents:UIControlEventValueChanged];
}


#pragma mark - tableView delegate方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}


#pragma mark - 利用segment切换策略和游记

- (void)switchSegment:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0: {
            self.travelNoteTableView.hidden = YES;
            self.strategyTableView.hidden = NO;
            break;
        }
        case 1: {
            self.travelNoteTableView.hidden = NO;
            self.strategyTableView.hidden = YES;
        }
        default:
            break;
    }
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
