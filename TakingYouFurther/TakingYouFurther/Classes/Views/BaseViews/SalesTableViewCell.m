//
//  SalesTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "SalesTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation SalesTableViewCell

- (void)setModel:(SaleModel *)model {
    _model = model;
    [self.iv sd_setImageWithURL:[NSURL URLWithString:model.thumbnail]];
    self.labelInfo.text = model.title;
    self.labelPrice.text = [NSString stringWithFormat:@"%ld", model.price_current];
    self.labelDiscount.text = [NSString stringWithFormat:@" %@ ", model.discount];
    self.labelDiscount.layer.borderColor = [UIColor orangeColor].CGColor;
    self.labelDiscount.layer.borderWidth = 1.2;
    self.labelTag.text = [NSString stringWithFormat:@" %@ ", model.tag];
    self.labelTag.layer.borderColor = [UIColor purpleColor].CGColor;
    self.labelTag.layer.borderWidth = 2;
    self.labelType.text = [NSString stringWithFormat:@" %@ ", model.type];
    self.labelType.layer.borderColor = [UIColor purpleColor].CGColor;
    self.labelType.layer.borderWidth = 2;
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
