//
//  MoreTableViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreModel.h"
#import "DestinationHeader.h"
@interface MoreTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iv;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelBrief;

@property (weak, nonatomic) IBOutlet UIButton *downBtn;

@property (weak, nonatomic) IBOutlet UILabel *downLabel;
@property (nonatomic, strong) MoreModel *model;

@end
