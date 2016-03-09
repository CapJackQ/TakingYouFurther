//
//  WLLRecommendCollectionViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/5.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLRecommendCollectionViewCell.h"
#import "WLLBoracayIslandModel.h"
#import "UIImageView+WebCache.h"

@interface WLLRecommendCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *recommendImage;
@property (strong, nonatomic) IBOutlet UILabel *destinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation WLLRecommendCollectionViewCell

-(void)setModel:(WLLBoracayIslandModel *)model {
    _model = model;
    
    [self.recommendImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.img]]];
    self.destinationLabel.text = model.title;
    self.descriptionLabel.text = model.subtitle;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
