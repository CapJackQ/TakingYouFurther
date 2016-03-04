//
//  WLLReviewTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLReviewTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface WLLReviewTableViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *reviewImage;

@end

@implementation WLLReviewTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [self.reviewImage sd_setImageWithURL:[NSURL URLWithString:@"http://file101.mafengwo.net/s8/M00/61/46/wKgBpVWSUeGAcbCmAABYy7jpfww72.jpeg"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
