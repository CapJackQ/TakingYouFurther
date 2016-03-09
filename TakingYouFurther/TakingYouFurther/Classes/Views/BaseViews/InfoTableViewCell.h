//
//  InfoTableViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoModel.h"

@interface InfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelArea;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIV;
@property (weak, nonatomic) IBOutlet UILabel *labelTemp;
@property (weak, nonatomic) IBOutlet UILabel *labelPassTime;
@property (weak, nonatomic) IBOutlet UILabel *labelNumOfPerson;
@property (weak, nonatomic) IBOutlet UIImageView *rightIV;
@property (nonatomic, strong) InfoModel *model;


@end
