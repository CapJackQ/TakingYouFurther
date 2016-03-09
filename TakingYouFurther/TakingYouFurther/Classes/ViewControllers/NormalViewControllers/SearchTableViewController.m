//
//  SearchTableViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "SearchTableViewController.h"
#import "DestinationHeader.h"
#import "HotSearchTableViewCell.h"
#import "DestinationManager.h"
#import "WLLDestinationViewController.h"
@interface SearchTableViewController ()

@end

@implementation SearchTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        
        
    }
    
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HotSearchTableViewCell" bundle:nil] forCellReuseIdentifier:@"hot"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hot" forIndexPath:indexPath];
    [cell setupView];
    NSMutableArray *hotArr = [DestinationManager shareInstance].dataHot;
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                
                [cell.segment setTitle:((HotModel *)hotArr[0]).name forSegmentAtIndex:0];
                [cell.segment setTitle:((HotModel *)hotArr[1]).name forSegmentAtIndex:1];
                [cell.segment setTitle:((HotModel *)hotArr[2]).name forSegmentAtIndex:2];
                [cell.segment setTitle:((HotModel *)hotArr[3]).name forSegmentAtIndex:3];
                [cell.segment addTarget:self action:@selector(sg1Action:) forControlEvents:UIControlEventValueChanged];
                
                
            } else {
                [cell.segment setTitle:((HotModel *)hotArr[4]).name forSegmentAtIndex:0];
                [cell.segment setTitle:((HotModel *)hotArr[5]).name forSegmentAtIndex:1];
                [cell.segment setTitle:((HotModel *)hotArr[6]).name forSegmentAtIndex:2];
                [cell.segment setTitle:((HotModel *)hotArr[7]).name forSegmentAtIndex:3];
                [cell.segment addTarget:self action:@selector(sg2Action:) forControlEvents:UIControlEventValueChanged];
                
            }
            
            break;
            
        case 1:
            
            if (indexPath.row == 0) {
                
                [cell.segment setTitle:((HotModel *)hotArr[8]).name forSegmentAtIndex:0];
                [cell.segment setTitle:((HotModel *)hotArr[9]).name forSegmentAtIndex:1];
                [cell.segment setTitle:((HotModel *)hotArr[10]).name forSegmentAtIndex:2];
                [cell.segment setTitle:((HotModel *)hotArr[11]).name forSegmentAtIndex:3];
                [cell.segment addTarget:self action:@selector(sg3Action:) forControlEvents:UIControlEventValueChanged];
                
            } else {
                [cell.segment setTitle:((HotModel *)hotArr[12]).name forSegmentAtIndex:0];
                [cell.segment setTitle:((HotModel *)hotArr[13]).name forSegmentAtIndex:1];
                [cell.segment setTitle:((HotModel *)hotArr[14]).name forSegmentAtIndex:2];
                [cell.segment setTitle:((HotModel *)hotArr[15]).name forSegmentAtIndex:3];
                [cell.segment addTarget:self action:@selector(sg4Action:) forControlEvents:UIControlEventValueChanged];
                
            }

            break;
            
        default:
            break;
    }
    
    
    

    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SWidth, 50)];
    headerView.backgroundColor = [UIColor whiteColor];
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 30, 30)];
    iv.backgroundColor = [UIColor orangeColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 200, 30)];
    label.textColor = [UIColor grayColor];
    switch (section) {
        case 0:
            label.text = @"国内热门";
            iv.image = [UIImage imageNamed:@"china"];
            break;
        case 1:
            label.text = @"国际热门";
            iv.image = [UIImage imageNamed:@"world"];
            break;
        default:
            break;
    }
    
    
    [headerView addSubview:iv];
    [headerView addSubview:label];
    
    return headerView;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)sg1Action:(UISegmentedControl *)sender {
    [((WLLDestinationViewController *)self.parentViewController) setSearchVCHidden:YES];
    [((WLLDestinationViewController *)self.parentViewController) loadData:((HotModel *)[DestinationManager shareInstance].dataHot[sender.selectedSegmentIndex]).jump_url];
    ((WLLDestinationViewController *)self.parentViewController).mddUrl = ((HotModel *)[DestinationManager shareInstance].dataHot[sender.selectedSegmentIndex]).jump_url;
    
}

- (void)sg2Action:(UISegmentedControl *)sender {
    [((WLLDestinationViewController *)self.parentViewController) setSearchVCHidden:YES];
    [((WLLDestinationViewController *)self.parentViewController) loadData:((HotModel *)[DestinationManager shareInstance].dataHot[sender.selectedSegmentIndex + 4]).jump_url];
    ((WLLDestinationViewController *)self.parentViewController).mddUrl = ((HotModel *)[DestinationManager shareInstance].dataHot[sender.selectedSegmentIndex + 4]).jump_url;
    
}

- (void)sg3Action:(UISegmentedControl *)sender {
    [((WLLDestinationViewController *)self.parentViewController) setSearchVCHidden:YES];
    [((WLLDestinationViewController *)self.parentViewController) loadData:((HotModel *)[DestinationManager shareInstance].dataHot[sender.selectedSegmentIndex + 8]).jump_url];
    ((WLLDestinationViewController *)self.parentViewController).mddUrl = ((HotModel *)[DestinationManager shareInstance].dataHot[sender.selectedSegmentIndex + 8]).jump_url;
}

- (void)sg4Action:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 3) {
        return;
    }
    
    [((WLLDestinationViewController *)self.parentViewController) setSearchVCHidden:YES];
    [((WLLDestinationViewController *)self.parentViewController) loadData:((HotModel *)[DestinationManager shareInstance].dataHot[sender.selectedSegmentIndex + 12]).jump_url];
    ((WLLDestinationViewController *)self.parentViewController).mddUrl = ((HotModel *)[DestinationManager shareInstance].dataHot[sender.selectedSegmentIndex + 12]).jump_url;
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
