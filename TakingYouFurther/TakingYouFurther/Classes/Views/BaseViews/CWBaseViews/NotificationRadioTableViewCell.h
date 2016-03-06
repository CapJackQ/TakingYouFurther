//
//  NotificationRadioTableViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationRadioTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *radioImageView;

@property (weak, nonatomic) IBOutlet UILabel *enterLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *theContentLabelWidth;

@end
