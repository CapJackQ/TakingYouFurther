//
//  NotificationViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "NotificationViewController.h"
#import "WLLUserViewManager.h"
#import "WLLLogInViewController.h"
#import "NotificationRadioTableViewCell.h"

#define kScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)

@interface NotificationViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *changeSegement;

@property (weak, nonatomic) IBOutlet UIView *theContentView;

@property (weak, nonatomic) IBOutlet UIScrollView *theScrollView;

@property (weak, nonatomic) IBOutlet UITableView *notificationRadioTableView;

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([WLLUserViewManager shareInstance].isLogIning == NO) {
        self.theScrollView.contentOffset = CGPointMake(kScreenWidth, 0);
    } else {
        self.theScrollView.contentOffset = CGPointMake(0, 0);
    }
    
    //设置选中的segement的index和scrollView的偏移量相一致
    self.changeSegement.selectedSegmentIndex = self.theScrollView.contentOffset.x / kScreenWidth;
    
    self.theScrollView.scrollEnabled = NO;
    
    self.edgesForExtendedLayout = NO;
    self.navigationItem.title = @"消息";
    
    [self.changeSegement addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
    //设置segement广播栏的tableView的代理
    self.notificationRadioTableView.delegate = self;
    self.notificationRadioTableView.dataSource = self;
    
    //登记segement广播栏的cell
    [self.notificationRadioTableView registerNib:[UINib nibWithNibName:@"NotificationRadioTableViewCell" bundle:nil] forCellReuseIdentifier:@"CWCell"];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)switchAction:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0: {
            if ([WLLUserViewManager shareInstance].isLogIning == NO) {
                WLLLogInViewController *logInVC = [[WLLLogInViewController alloc]
                                                   initWithNibName:@"WLLLogInViewController"
                                                   bundle:nil];
                [self.navigationController pushViewController:logInVC animated:YES];
            } else {
                self.theScrollView.contentOffset = CGPointMake(0, 0);
            }
            
            break;
        }
        case 1: {
            self.theScrollView.contentOffset = CGPointMake(kScreenWidth, 0);
            break;
        }
        case 2: {
            if ([WLLUserViewManager shareInstance].isLogIning == NO) {
                WLLLogInViewController *logInVC = [[WLLLogInViewController alloc]
                                                   initWithNibName:@"WLLLogInViewController"
                                                   bundle:nil];
                [self.navigationController pushViewController:logInVC animated:YES];
            } else {
                self.theScrollView.contentOffset = CGPointMake(2 * kScreenWidth, 0);
            }
            
            break;
        }
        default:
            break;
    }
    
    self.changeSegement.selectedSegmentIndex = self.theScrollView.contentOffset.x / kScreenWidth;
}

#pragma mark - notificationRadio栏 tableView delegate方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NotificationRadioTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CWCell" forIndexPath:indexPath];
    return cell;
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
