//
//  InfoTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "InfoTableViewCell.h"

@implementation InfoTableViewCell


- (void)setModel:(InfoModel *)model {
    _model = model;
    self.labelArea.text = model.name;
    self.labelPassTime.text = model.num_url[@"title"];
    NSString *str = [model.num_url[@"num"] stringValue];
    self.labelNumOfPerson.text = str;
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
