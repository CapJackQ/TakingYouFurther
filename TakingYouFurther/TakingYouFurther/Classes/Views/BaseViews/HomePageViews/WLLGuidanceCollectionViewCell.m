//
//  WLLGuidanceCollectionViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLGuidanceCollectionViewCell.h"
#import "WLLGuidanceModel.h"
#import "UIImageView+WebCache.h"

@interface WLLGuidanceCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *guidanceImage;
@property (strong, nonatomic) IBOutlet UILabel *guidanceLabel;

@end

@implementation WLLGuidanceCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(WLLGuidanceModel *)model {
    
    _model = model;
    
    self.guidanceLabel.text = model.title;
    
    [self.guidanceImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.icon]]];

    
}

@end
