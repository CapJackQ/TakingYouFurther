//
//  CheckMoreTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "CheckMoreTableViewCell.h"

@implementation CheckMoreTableViewCell

- (void)setModel:(CheckMoreModel *)model {
    _model = model;
    self.labelCheck.text = model.bottom;
    self.labelCheck.layer.borderColor = [UIColor orangeColor].CGColor;
    self.labelCheck.layer.borderWidth = 1.2;
    self.labelCheck.layer.masksToBounds = YES;
    self.labelCheck.layer.cornerRadius = 8;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
