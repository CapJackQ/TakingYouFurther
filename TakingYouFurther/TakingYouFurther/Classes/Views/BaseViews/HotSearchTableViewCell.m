//
//  HotSearchTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "HotSearchTableViewCell.h"

@implementation HotSearchTableViewCell



- (void)setupView {
    self.segment.tintColor = [UIColor clearColor];
    NSDictionary *selectedAttribure = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16], NSForegroundColorAttributeName:[UIColor purpleColor]};
    NSDictionary *unselectedAttribure = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16], NSForegroundColorAttributeName:[UIColor blackColor]};
    [self.segment setTitleTextAttributes:selectedAttribure forState:UIControlStateSelected];
    [self.segment setTitleTextAttributes:unselectedAttribure forState:UIControlStateNormal];
    
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
