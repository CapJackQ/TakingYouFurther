//
//  CheckMoreTableViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckMoreModel.h"
@interface CheckMoreTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelCheck;
@property (nonatomic, strong) CheckMoreModel *model;

@end
