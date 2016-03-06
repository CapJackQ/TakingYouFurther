//
//  WLLPopDstinationTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLPopDstinationTableViewCell.h"
#import "WLLDestinationModel.h"
#import "WLLHomePageDataManager.h"

@interface WLLPopDstinationTableViewCell ()

@end

@implementation WLLPopDstinationTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

-(void)action {
    
}


// 点击事件
- (IBAction)moreCheckAction:(UIButton *)sender {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action) name:@"push" object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"push" object:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
