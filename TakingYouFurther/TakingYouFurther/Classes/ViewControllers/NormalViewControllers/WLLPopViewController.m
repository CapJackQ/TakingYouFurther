//
//  WLLPopViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLPopViewController.h"

@interface WLLPopViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (strong, nonatomic) IBOutlet UITableView *firstTableView;

@end

@implementation WLLPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstTableView.dataSource = self;
    self.firstTableView.delegate = self;
    self.segmentControl.selectedSegmentIndex = 0;
}

#pragma mark - 显示系统 NavigationBar
-(void)setNaviBarHidden:(BOOL)isHidden {
    self.navigationController.navigationBarHidden = isHidden;
}

-(void)viewWillAppear:(BOOL)animated {
    [self setNaviBarHidden:NO];
    self.firstTableView.hidden = YES;
}

#pragma mark - UITableView Delegate

#pragma mark number Of Rows In Section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

#pragma mark cell For Row At IndexPath
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"我也很想他";
    cell.detailTextLabel.text = @"孙燕姿";
    return cell;
}

#pragma mark - 不同选择方法
- (IBAction)selectDifferentStyle:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0) {
        self.firstTableView.hidden = NO;
    } else {
        self.firstTableView.hidden = YES;
    }
    
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
