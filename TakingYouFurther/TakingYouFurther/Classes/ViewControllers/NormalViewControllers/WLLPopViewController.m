//
//  WLLPopViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLPopViewController.h"
#import "WLLMainTableViewCell.h"
#define kHeight CGRectGetHeight([UIScreen mainScreen].bounds)


@interface WLLPopViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *firstTableView;
@property (strong, nonatomic) IBOutlet UITableView *secondTableView;
@property (strong, nonatomic) IBOutlet UITableView *thirdTableView;
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *firstToLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *secToLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *thirdToLabel;

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
    

}

#pragma mark - 显示系统 NavigationBar
-(void)setNaviBarHidden:(BOOL)isHidden {
    self.navigationController.navigationBarHidden = isHidden;
}

-(void)viewWillAppear:(BOOL)animated {
    [self setNaviBarHidden:NO];
    self.firstToLabel.constant = kHeight;
    self.secToLabel.constant = kHeight;
    self.thirdToLabel.constant = kHeight;
    self.typeButton.selected = NO;
    self.departureButton.selected = NO;
    self.filteButton.selected = NO;
    self.ensureButton.hidden = YES;
}

#pragma mark - UITableView Delegate

#pragma mark number Of Rows In Section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([tableView isEqual:self.firstTableView]) {
        return 30;
    }
    if ([tableView isEqual:self.secondTableView]) {
        return 10;
    }
    if ([tableView isEqual:self.thirdToLabel]) {
        return 20;
    }
    return 10;
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
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:self.mainTableView]) {
        return 200;
    }
    return 50;
}


#pragma mark - 不同选择方法

#pragma mark 产品类型
- (IBAction)clickAllTypeAction:(UIButton *)sender {
    
    if (sender.selected == NO) {
        self.secToLabel.constant = kHeight;
        self.thirdToLabel.constant = kHeight;
        self.firstToLabel.constant = 0;
        self.departureButton.selected = NO;
        self.filteButton.selected = NO;
        self.mainTableView.hidden = YES;
        self.ensureButton.hidden = YES;
        sender.selected = YES;
    } else {
        self.firstToLabel.constant = kHeight;
        sender.selected = NO;
        self.mainTableView.hidden = NO;
    }
}

#pragma mark 出发地
- (IBAction)clickDepartureAction:(UIButton *)sender {
    if (sender.selected == NO) {
        self.firstToLabel.constant = kHeight;
        self.thirdToLabel.constant = kHeight;
        self.secToLabel.constant = 0;
        self.typeButton.selected = NO;
        self.filteButton.selected = NO;
        self.mainTableView.hidden = YES;
        self.ensureButton.hidden = YES;
        sender.selected = YES;
        
    } else {
        self.secToLabel.constant = kHeight;
        sender.selected = NO;
        self.mainTableView.hidden = NO;
    }
}

#pragma mark 筛选
- (IBAction)clickFilterAction:(UIButton *)sender {
    if (sender.selected == NO) {
        self.firstToLabel.constant = kHeight;
        self.secToLabel.constant = kHeight;
        self.thirdToLabel.constant = 0;
        sender.selected = YES;
        self.typeButton.selected = NO;
        self.departureButton.selected = NO;
        self.ensureButton.hidden = NO;
        self.mainTableView.hidden = YES;
    } else {
        self.thirdToLabel.constant = kHeight;
        sender.selected = NO;
        self.ensureButton.hidden = YES;
        self.mainTableView.hidden = NO;
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
