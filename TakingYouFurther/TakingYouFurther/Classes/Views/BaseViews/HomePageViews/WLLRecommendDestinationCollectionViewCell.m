//
//  WLLRecommendDestinationCollectionViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLRecommendDestinationCollectionViewCell.h"
#import "WLLRecommendModel.h"
#import "UIImageView+WebCache.h"

@interface WLLRecommendDestinationCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *recommendImage;
@property (strong, nonatomic) IBOutlet UILabel *monthLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation WLLRecommendDestinationCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(WLLRecommendModel *)model {
    _model = model;
    
    [self.recommendImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.img_url]]];
    self.monthLabel.text = model.title;
    self.descriptionLabel.text = model.sub_title;
}

@end
