//
//  WLLPersonalPageViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/9.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLPersonalPageViewController.h"

#define kReuseIdentifierTwo @"CWCellTwo"
#define kScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)

@interface WLLPersonalPageViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *switchSegment;

@property (weak, nonatomic) IBOutlet UIScrollView *theScrollView;

@end

@implementation WLLPersonalPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //把状态栏设置为透明的
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    [self.switchSegment addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)switchAction:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0: {
            self.theScrollView.contentOffset = CGPointMake(0, 0);
            break;
        }
        case 1: {
            self.theScrollView.contentOffset = CGPointMake(kScreenWidth, 0);
            break;
        }
        case 2: {
            self.theScrollView.contentOffset = CGPointMake(kScreenWidth * 2, 0);
            break;
        }
        case 3: {
            self.theScrollView.contentOffset = CGPointMake(kScreenWidth * 3, 0);
            break;
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
