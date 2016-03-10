//
//  SettingInTableViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "SettingInTableViewController.h"
#import "TheMoreModel.h"
#import "RecommendedModel.h"
#import "SettingInTableViewCell.h"
#import "WLLUserViewManager.h"
#import "LogOutModel.h"
#import "LogOutTableViewCell.h"
#import <AVOSCloud/AVOSCloud.h>
#import "WLLLogInViewController.h"

@interface SettingInTableViewController ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation SettingInTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"更多";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SettingInTableViewCell" bundle:nil] forCellReuseIdentifier:@"CW"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LogOutTableViewCell" bundle:nil] forCellReuseIdentifier:@"CWCellCW"];
    
    [self update];
}


- (void)update {
    
    self.data = [NSMutableArray array];
    
    NSMutableArray *array1 = [NSMutableArray array];
    TheMoreModel *model1 = [[TheMoreModel alloc] init];
    model1.theMoreTitle = @"通知设置";
    TheMoreModel *model2 = [[TheMoreModel alloc] init];
    model2.theMoreTitle = @"清楚缓存";
    model2.theDetailInfo = @"0.00MB";
    [array1 addObject:model1];
    [array1 addObject:model2];
    [self.data addObject:array1];
    
    NSMutableArray *array2 = [NSMutableArray array];
    TheMoreModel *model3 = [[TheMoreModel alloc] init];
    model3.theMoreTitle = @"常见问题与反馈";
    TheMoreModel *model4 = [[TheMoreModel alloc] init];
    model4.theMoreTitle = @"推荐好友";
    TheMoreModel *model5 = [[TheMoreModel alloc] init];
    model5.theMoreTitle = @"支持我们， 打分评价";
    TheMoreModel *model6 = [[TheMoreModel alloc] init];
    model6.theMoreTitle = @"关于let's go";
    model6.theDetailInfo = @"7.4.0";
    [array2 addObject:model3];
    [array2 addObject:model4];
    [array2 addObject:model5];
    [array2 addObject:model6];
    [self.data addObject:array2];
    
    NSMutableArray *array3 = [NSMutableArray array];
    RecommendedModel *model7 = [[RecommendedModel alloc] init];
    model7.firstImage = [UIImage imageNamed:@"recommendOne"];
    model7.secondImage = [UIImage imageNamed:@"recommendTwo"];
    model7.thirdImage = [UIImage imageNamed:@"recommendThree"];
    [array3 addObject:model7];

    [self.data addObject:array3];
    
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.data.count == 4) {
        return;
    }
    if ([WLLUserViewManager shareInstance].isLogIning == YES) {
        //在self.data中吧第一个数组取出来，加一个model，然后再替换进去
        NSMutableArray *array = self.data[0];
        TheMoreModel *model = [[TheMoreModel alloc] init];
        model.theMoreTitle = @"账户绑定与设置";
        [array insertObject:model atIndex:0];
        [self.data replaceObjectAtIndex:0 withObject:array];
        
        NSMutableArray *array2 = [NSMutableArray array];
        LogOutModel *model2 = [[LogOutModel alloc] init];
        model2.labelTitle = @"退出当前账号";
        [array2 addObject:model2];
        [self.data addObject:array2];
        
        [self.tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    switch (section) {
//        case 0: {
//            return 2;
//            break;
//        }
//        case 1: {
//            return 4;
//            break;
//        }
//        case 2: {
//            return 2;
//            break;
//        }
//            
//        default:
//            break;
//    }
//    return 0;
    return [self.data[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        
        SettingInTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CW" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.section == 3) {
        
        LogOutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CWCellCW" forIndexPath:indexPath];
        LogOutModel *model = self.data[3][0];
        cell.logOutLabel.text = model.labelTitle;
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CWCell"];
        
        if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CWCell"];
    }
        
        TheMoreModel *model1 = self.data[indexPath.section][indexPath.row];
        cell.textLabel.text = model1.theMoreTitle;
        cell.detailTextLabel.text = model1.theDetailInfo;
        
        return cell;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2 && indexPath.row == 0) {
        return 120;
    } else {
        return 46;
    };
}

-  (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WLLLogInViewController *logVC = [[WLLLogInViewController alloc] initWithNibName:@"WLLLogInViewController" bundle:nil];
    
    if (indexPath.section == 3) {
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }];
        UIAlertAction *excuteAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [AVUser logOut];
            [self.navigationController pushViewController:logVC animated:YES];
        }];
        UIAlertController *alVC = [UIAlertController alertControllerWithTitle:@"确定退出吗" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        [alVC addAction:cancelAction];
        [alVC addAction:excuteAction];
        
        [self.navigationController presentViewController:alVC animated:YES completion:nil];
        [WLLUserViewManager shareInstance].isLogIning = NO;
    
}
                                   
                                   
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
