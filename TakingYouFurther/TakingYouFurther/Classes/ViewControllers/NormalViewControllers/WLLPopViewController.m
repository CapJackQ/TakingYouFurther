//
//  WLLPopViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLPopViewController.h"
#import "WLLMainTableViewCell.h"
#import "WLLHomePageDataManager.h"
#import "WLLPopModel.h"
#import "WLLHomePageUrlHeader.h"


#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define kHeight CGRectGetHeight([UIScreen mainScreen].bounds)

@interface WLLPopViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *firstTableView;
@property (strong, nonatomic) IBOutlet UITableView *secondTableView;
@property (strong, nonatomic) IBOutlet UITableView *thirdTableView;
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;

@property (strong, nonatomic) IBOutlet UIButton *typeButton;
@property (strong, nonatomic) IBOutlet UIButton *departureButton;
@property (strong, nonatomic) IBOutlet UIButton *filteButton;
@property (strong, nonatomic) IBOutlet UIButton *ensureButton;

@end

@implementation WLLPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstTableView.dataSource = self;
    self.firstTableView.delegate = self;
    
    self.secondTableView.dataSource = self;
    self.secondTableView.delegate = self;
    
    self.thirdTableView.dataSource = self;
    self.thirdTableView.delegate = self;
    
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
    
    [self.mainTableView registerNib:[UINib nibWithNibName:@"WLLMainTableViewCell" bundle:nil] forCellReuseIdentifier:@"main_cell"];
    NSInteger index = [WLLHomePageDataManager shareInstance].index;
    
    NSMutableArray *array = [WLLHomePageDataManager shareInstance].pathArray;
    
    
    [[WLLHomePageDataManager shareInstance] requestPopDestinationDataWithUrl:array[index] didFinished:^{
        [self.mainTableView reloadData];
    }];
}

#pragma mark - 显示系统 NavigationBar
-(void)setNaviBarHidden:(BOOL)isHidden {
    self.navigationController.navigationBarHidden = isHidden;
}

-(void)viewWillAppear:(BOOL)animated {
    [self setNaviBarHidden:NO];

    self.typeButton.selected = NO;
    self.departureButton.selected = NO;
    self.filteButton.selected = NO;
    self.ensureButton.hidden = YES;
    
    self.firstTableView.frame = CGRectMake(0, 64+48, kWidth, 0);
    self.secondTableView.frame = CGRectMake(0, 64+48, kWidth, 0);
    self.thirdTableView.frame = CGRectMake(0, 64+48, kWidth, 0);
    self.mainTableView.frame = CGRectMake(0, 64+48, kWidth, 0);
}

#pragma mark - UITableView Delegate

#pragma mark number Of Rows In Section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([tableView isEqual:self.firstTableView]) {
        return 5;
    }
    if ([tableView isEqual:self.secondTableView]) {
        return 10;
    }
    if ([tableView isEqual:self.thirdTableView]) {
        return 10;
    }
    return [[WLLHomePageDataManager shareInstance] countOfPopDestinationArray];
}

#pragma mark cell For Row At IndexPath
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView isEqual:self.firstTableView]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_first"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell_first"];
        }
        cell.textLabel.text = @"我也很想他";
        cell.detailTextLabel.text = @"孙燕姿";
        return cell;
    }
    if ([tableView isEqual:self.secondTableView]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_second"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell_second"];
        }
        cell.textLabel.text = @"夜半小夜曲";
        cell.detailTextLabel.text = @"孙燕姿";
        return cell;
    }
    if ([tableView isEqual:self.thirdTableView]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_third"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell_third"];
        }
        cell.textLabel.text = @"原点";
        cell.detailTextLabel.text = @"孙燕姿";
        return cell;

    }
    WLLMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"main_cell" forIndexPath:indexPath];
    WLLPopModel *model = [[WLLHomePageDataManager shareInstance] popModelWithIndex:indexPath.row];
    cell.model = model;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:self.mainTableView]) {
        return kHeight/3.68;
    }
    return 50;
}


#pragma mark - 不同选择方法

#pragma mark 产品类型
- (IBAction)clickAllTypeAction:(UIButton *)sender {
    
    if (sender.selected == NO) {

        self.departureButton.selected = NO;
        self.filteButton.selected = NO;
        
        self.ensureButton.hidden = YES;
        sender.selected = YES;
        
//        self.firstTableView.frame = CGRectMake(0, 64+48, kWidth, 0);
        [UIView animateWithDuration:0.5 animations:^{

            self.mainTableView.hidden = YES;
            self.firstTableView.frame = CGRectMake(0, 64+48, kWidth, kHeight);
        }];
        
    
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.firstTableView.frame = CGRectMake(0, 64+48, kWidth, 0);
        } completion:^(BOOL finished) {
            self.mainTableView.hidden = NO;
        }];
        sender.selected = NO;
    }
}

#pragma mark 出发地
- (IBAction)clickDepartureAction:(UIButton *)sender {
    if (sender.selected == NO) {
        self.typeButton.selected = NO;
        self.filteButton.selected = NO;
        self.ensureButton.hidden = YES;
        sender.selected = YES;
        
//        self.secondTableView.frame = CGRectMake(0, 64+48, kWidth, 0);
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.mainTableView.hidden = YES;
            self.mainTableView.frame = CGRectMake(0, kHeight, kWidth, 0);
            self.secondTableView.frame = CGRectMake(0, 64+48, kWidth, kHeight);
        }];
        
    } else {

        [UIView animateWithDuration:0.5 animations:^{
            self.secondTableView.frame = CGRectMake(0, 64+48, kWidth, 0);
            self.mainTableView.frame = CGRectMake(0, 64+48, kWidth, kHeight);
        } completion:^(BOOL finished) {
            
        }];

        sender.selected = NO;
    }
}

#pragma mark 筛选
- (IBAction)clickFilterAction:(UIButton *)sender {
    if (sender.selected == NO) {
        sender.selected = YES;
        self.typeButton.selected = NO;
        self.departureButton.selected = NO;
        self.ensureButton.hidden = NO;
        self.mainTableView.hidden = YES;
        
//        self.thirdTableView.frame = CGRectMake(0, 64+48, kWidth, 0);
        [UIView animateWithDuration:0.5 animations:^{
            self.thirdTableView.frame = CGRectMake(0, 64+48, kWidth, kHeight);
        }];
        
    } else {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.thirdTableView.frame = CGRectMake(0, 64+48, kWidth, 0);
        } completion:^(BOOL finished) {
            self.ensureButton.hidden = YES;
            self.mainTableView.hidden = NO;
        }];
        sender.selected = NO;
        
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
