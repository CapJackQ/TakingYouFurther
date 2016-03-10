//
//  WLLReviewTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLReviewTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Model.h"

@interface WLLReviewTableViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *reviewImage;

@end

@implementation WLLReviewTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

-(void)setModel:(Model *)model {
    _model = model;
    
    [self.reviewImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.img_url]]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
