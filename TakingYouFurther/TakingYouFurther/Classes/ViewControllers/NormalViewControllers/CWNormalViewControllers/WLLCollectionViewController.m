//
//  WLLCollectionViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/9.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLCollectionViewController.h"

#define kScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)

@interface WLLCollectionViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *switchSegment;

@property (weak, nonatomic) IBOutlet UIScrollView *theScrollView;
@property (weak, nonatomic) IBOutlet UIView *noDestinationView;

@end

@implementation WLLCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.noDestinationView.hidden = YES;
    
    self.edgesForExtendedLayout = NO;
    self.navigationItem.title = @"我的收藏";
    
    self.theScrollView.scrollEnabled = NO;
    
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
