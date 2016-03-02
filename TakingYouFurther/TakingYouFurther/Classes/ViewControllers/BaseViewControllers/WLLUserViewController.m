//
//  WLLUserViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/2/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLUserViewController.h"
#import "UserModel.h"
#import "UserTableViewCell.h"

#define kReuseIdentifier @"CWCell"

@interface WLLUserViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation WLLUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self update];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    [self.tableview registerNib:[UINib nibWithNibName:@"UserTableViewCell" bundle:nil]
         forCellReuseIdentifier:kReuseIdentifier];

}

- (void)viewWillAppear:(BOOL)animated {
    
    
    self.parentViewController.navigationItem.title = @"我的";
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingIcon"]
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(leftAction)];
    self.tabBarController.navigationItem.leftBarButtonItem = left;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NotificationIcon"]
                                                              style:UIBarButtonItemStyleDone
                                                             target:self
                                                             action:@selector(rightAction)];
    self.tabBarController.navigationItem.rightBarButtonItem = right;
}

#pragma mark - 设置和消息按钮

- (void)leftAction {
    
}

- (void)rightAction {
    
}

- (void)viewWillDisappear:(BOOL)animated {
    self.parentViewController.navigationItem.title = nil;
    
    self.tabBarController.navigationItem.leftBarButtonItem = nil;
    
    self.tabBarController.navigationItem.rightBarButtonItem = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview 代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: {
            return 1;
            break;
        }
        case 1: {
            return 2;
            break;
        }
        case 2: {
            return 2;
            break;
        }
        case 3: {
            return 2;
            break;
        }
        case 4: {
            return 1;
            break;
        }
        default:
            break;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kReuseIdentifier];
    }
    
    UserModel *model = self.data[indexPath.section][indexPath.row];
    cell.photoImageView.image = model.photoImage;
    cell.activityLabel.text = model.myActivity;
    return cell;
}

#pragma mark - 给self.data 数组添加数据，加载tableview

- (void)update {
    self.data = [NSMutableArray array];
    
    NSMutableArray *array1 = [NSMutableArray array];
    UserModel *model1 = [[UserModel alloc] init];
    model1.photoImage = [UIImage imageNamed:@"login"];
    model1.myActivity = @"点击登录";
    [array1 addObject:model1];
    [self.data addObject:array1];
    
    NSMutableArray *array2 = [NSMutableArray array];
    UserModel *model2 = [[UserModel alloc] init];
    model2.photoImage = [UIImage imageNamed:@"download"];
    model2.myActivity = @"我的下载";
    [array2 addObject:model2];
    UserModel *model3 = [[UserModel alloc] init];
    model3.photoImage = [UIImage imageNamed:@"collection"];
    model3.myActivity = @"我的收藏";
    [array2 addObject:model3];
    [self.data addObject:array2];
    
    NSMutableArray *array3 = [NSMutableArray array];
    UserModel *model4 = [[UserModel alloc] init];
    model4.photoImage = [UIImage imageNamed:@"order"];
    model4.myActivity = @"我的订单";
    [array3 addObject:model4];
    UserModel *model5 = [[UserModel alloc] init];
    model5.photoImage = [UIImage imageNamed:@"discount"];
    model5.myActivity = @"我的优惠券";
    [array3 addObject:model5];
    [self.data addObject:array3];
    
    NSMutableArray *array4 = [NSMutableArray array];
    UserModel *model6 = [[UserModel alloc] init];
    model6.photoImage = [UIImage imageNamed:@"comment"];
    model6.myActivity = @"我的点评";
    [array4 addObject:model6];
    UserModel *model7 = [[UserModel alloc] init];
    model7.photoImage = [UIImage imageNamed:@"problem"];
    model7.myActivity = @"我的问答";
    [array4 addObject:model7];
    [self.data addObject:array4];
    
    NSMutableArray *array5 = [NSMutableArray array];
    UserModel *model8 = [[UserModel alloc] init];
    model8.photoImage = [UIImage imageNamed:@"activity"];
    model8.myActivity = @"我的活动";
    [array5 addObject:model8];
    [self.data addObject:array5];
    
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
