//
//  WLLRecommendDestinationTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLRecommendDestinationTableViewCell.h"

@interface WLLRecommendDestinationTableViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *recommendLabel;

@end

@implementation WLLRecommendDestinationTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
