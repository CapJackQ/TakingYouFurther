//
//  CateTableViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CateModel.h"
@interface CateTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iv1;
@property (weak, nonatomic) IBOutlet UIImageView *iv2;
@property (weak, nonatomic) IBOutlet UIImageView *iv3;
@property (weak, nonatomic) IBOutlet UILabel *labelCate1;
@property (weak, nonatomic) IBOutlet UILabel *labelCate2;
@property (weak, nonatomic) IBOutlet UILabel *labelCate3;
@property (weak, nonatomic) IBOutlet UILabel *labelNumOfArea1;
@property (weak, nonatomic) IBOutlet UILabel *labelNumOfArea2;
@property (weak, nonatomic) IBOutlet UILabel *labelNumOfArea3;
@property (weak, nonatomic) IBOutlet UIView *touchView1;

@property (weak, nonatomic) IBOutlet UIView *touchView2;

@property (weak, nonatomic) IBOutlet UIView *touchView3;

@property (nonatomic, strong) NSMutableArray *modelArr;


@end
