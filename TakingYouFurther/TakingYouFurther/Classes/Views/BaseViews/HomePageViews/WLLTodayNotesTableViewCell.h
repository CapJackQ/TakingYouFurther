//
//  WLLTodayNotesTableViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLLTodayNotesTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *todayNotesImage;
@property (strong, nonatomic) IBOutlet UIImageView *headImage;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *destinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end
