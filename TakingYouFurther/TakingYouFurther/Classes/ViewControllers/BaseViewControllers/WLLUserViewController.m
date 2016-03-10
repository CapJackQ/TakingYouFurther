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
#import "WLLLogInViewController.h"
#import "WLLMyDownloadViewController.h"
#import "SettingInTableViewController.h"
#import "NotificationViewController.h"
#import "WLLUserViewManager.h"
#import "LogInfirstCellModel.h"
#import "LogInSecondCellModel.h"
#import "logInFirstTableViewCell.h"
#import "LogInSecondTableViewCell.h"
#import "WLLPersonalPageViewController.h"
#import "WLLCollectionViewController.h"
#import <AVOSCloud/AVOSCloud.h>


#define kReuseIdentifier @"CWCell"
#define kReuseIdentifierTwo @"CWCell2"
#define kReuseIdentifierThree @"CWCell3"

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
    
    [self.tableview registerNib:[UINib nibWithNibName:@"logInFirstTableViewCell" bundle:nil] forCellReuseIdentifier:kReuseIdentifierTwo];
    
    [self.tableview registerNib:[UINib nibWithNibName:@"LogInSecondTableViewCell" bundle:nil] forCellReuseIdentifier:kReuseIdentifierThree];

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
    
    //判断，当为登陆状态时，弹出登陆状态的页面（数据和未登陆时的不一样）
    if ([WLLUserViewManager shareInstance].isLogIning == YES) {
        
//        AVObject *destinationObject = [[AVObject alloc] initWithClassName:@"Destination"];
//        
//        [destinationObject setObject:@"id1234" forKey:@"destination"];
//        destinationObject.fetchWhenSave = YES;
//        [destinationObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            AVRelation *relationShip = [[AVUser currentUser] relationForKey:@"userDestination"];
//            [relationShip addObject:destinationObject];
//            [[AVUser currentUser] saveInBackground];
//        }];
//        
//        AVUser *user = [AVUser objectWithoutDataWithClassName:@"_User" objectId:[AVUser currentUser].objectId];
//        AVRelation *relation = [user relationForKey:@"userDestination"];
//        AVQuery *query = [relation query];
//        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//            for (AVObject *ob in objects) {
//                NSString *str = ob[@"destination"];
//                NSLog(@"%@", str);
//            };
//        }];
        
        
        if (self.data.count == 6) {
            return;
        }
        
        //先删除原来的第一列的cell
        [self.data removeObjectAtIndex:0];
        
        //插入第一区
        NSMutableArray *array1 = [NSMutableArray array];
        LogInfirstCellModel *model1 = [[LogInfirstCellModel alloc] init];
        model1.headImage = [UIImage imageNamed:@"iconfont-user"];
        model1.userName = @"TakingYouFurther";
        model1.focusNumber = 1;
        model1.followers = 0;
        [array1 addObject:model1];
        [self.data insertObject:array1 atIndex:0];
        
        //插入第二区
        NSMutableArray *array2 = [NSMutableArray array];
        LogInSecondCellModel *model2 = [[LogInSecondCellModel alloc] init];
        model2.headImage = [UIImage imageNamed:@"iconfont-pingzi"];
        model2.myActivity = @"我的蜜蜂";
        model2.honeyNumber = 0;
        [array2 addObject:model2];
        
        [self.data insertObject:array2 atIndex:1];
        
        [self.tableview reloadData];
        
    } else {
        [self update];
        [self.tableview reloadData];
    }

}

- (void)viewWillDisappear:(BOOL)animated {
    
    self.parentViewController.navigationItem.title = nil;
    
    self.tabBarController.navigationItem.leftBarButtonItem = nil;
    
    self.tabBarController.navigationItem.rightBarButtonItem = nil;
}

#pragma mark - 设置和消息按钮

- (void)leftAction {
    SettingInTableViewController *stVC = [[SettingInTableViewController alloc]
                                          initWithNibName:@"SettingInTableViewController" bundle:nil];
    [self.navigationController pushViewController:stVC animated:YES];
}

- (void)rightAction {
    NotificationViewController *nVC = [[NotificationViewController alloc] initWithNibName:@"NotificationViewController" bundle:nil];
    [self.navigationController pushViewController:nVC animated:YES];
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
    
    return [self.data[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //未登陆时，进入的页面
    if ([WLLUserViewManager shareInstance].isLogIning == NO) {
        UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
        if (!cell) {
            cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReuseIdentifier];
        }
        
        UserModel *model = self.data[indexPath.section][indexPath.row];
        cell.photoImageView.image = model.photoImage;
        cell.activityLabel.text = model.myActivity;
        
        if (indexPath.section != 0) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
        
    //登录时进入的页面
    } else {
        
        if (indexPath.section == 0 && indexPath.row == 0) {
            
            logInFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifierTwo forIndexPath:indexPath];
            
            LogInfirstCellModel *model = self.data[0][0];
            
            cell.headImageView.image = model.headImage;
            cell.nameLabel.text = model.userName;
            cell.focusLabel.text = [NSString stringWithFormat:@"%ld", model.focusNumber];
            cell.followsLable.text = [NSString stringWithFormat:@"%ld", model.followers];
            
            return cell;
        } else if (indexPath.section == 1) {
        
            LogInSecondCellModel *model = self.data[1][0];
            
            LogInSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifierThree forIndexPath:indexPath];
            cell.photoImageView.image = model.headImage;
            cell.activityLabel.text = model.myActivity;
            cell.honeyNumberLabel.text = [NSString stringWithFormat:@"%ld", model.honeyNumber];
            
            return cell;
        } else {
            
            UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
//            if (!cell) {
//                cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReuseIdentifier];
//            }
            
            UserModel *model = self.data[indexPath.section][indexPath.row];
            cell.photoImageView.image = model.photoImage;
            cell.activityLabel.text = model.myActivity;
            
            return cell;
        }
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    }
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WLLLogInViewController *logInVC = [[WLLLogInViewController alloc] initWithNibName:@"WLLLogInViewController" bundle:nil];
    
    WLLMyDownloadViewController *downloadVC = [[WLLMyDownloadViewController alloc] initWithNibName:@"WLLMyDownloadViewController" bundle:nil];
    
    WLLPersonalPageViewController *pgVC = [[WLLPersonalPageViewController alloc] initWithNibName:@"WLLPersonalPageViewController" bundle:nil];
    
    WLLCollectionViewController *clVC = [[WLLCollectionViewController alloc] initWithNibName:@"WLLCollectionViewController" bundle:nil];
    
    
    if ([WLLUserViewManager shareInstance].isLogIning == NO) {
        
        if (indexPath.section == 1 && indexPath.row == 0) {
            [self.navigationController pushViewController:downloadVC animated:YES];
        } else {
            [self.navigationController pushViewController:logInVC animated:YES];
        }
        
    } else {
        
        //推出登陆状态的界面
        if (indexPath.section == 0 ) {
            [self.navigationController pushViewController:pgVC animated:YES];
        } else if (indexPath.section == 2 && indexPath.row == 1) {
            [self.navigationController pushViewController:clVC animated:YES];
        }
        
    }
    
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
