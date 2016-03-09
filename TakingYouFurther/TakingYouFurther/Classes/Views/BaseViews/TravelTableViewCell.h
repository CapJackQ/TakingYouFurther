//
//  TravelTableViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TravelModel.h"
@interface TravelTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iv1;
@property (weak, nonatomic) IBOutlet UIImageView *iv2;
@property (weak, nonatomic) IBOutlet UIImageView *iv3;
@property (weak, nonatomic) IBOutlet UIImageView *pv1;
@property (weak, nonatomic) IBOutlet UIImageView *pv2;
@property (weak, nonatomic) IBOutlet UIImageView *pv3;

@property (weak, nonatomic) IBOutlet UILabel *pLabel1;

@property (weak, nonatomic) IBOutlet UILabel *pLabel2;

@property (weak, nonatomic) IBOutlet UILabel *pLabel3;

@property (nonatomic, strong) NSMutableArray *modelArr;


@end
