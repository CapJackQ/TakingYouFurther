//
//  LiveCollectionViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "LiveCollectionViewCell.h"

@implementation LiveCollectionViewCell

- (void)setModel:(LiveModel *)model {
    _model = model;
    self.labelArea.text = model.name;
    NSInteger num = (NSInteger)(model.choice_percent * 100);
    self.labelPercent.text = [NSString stringWithFormat:@"%ld%%", num];
    
}

- (void)awakeFromNib {
    // Initialization code
}

@end
