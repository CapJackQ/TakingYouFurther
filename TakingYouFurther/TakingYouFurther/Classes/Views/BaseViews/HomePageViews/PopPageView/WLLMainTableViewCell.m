//
//  WLLMainTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/5.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLMainTableViewCell.h"
#import "WLLPopModel.h"
#import "UIImageView+WebCache.h"

@interface WLLMainTableViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *mainImage;
@property (strong, nonatomic) IBOutlet UILabel *destinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *styleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *suffixLabel;
@property (strong, nonatomic) IBOutlet UILabel *barginLabel;

@end

@implementation WLLMainTableViewCell


-(void)setModel:(WLLPopModel *)model {
    
    _model = model;
    
    [self.mainImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.img]]];
    
    self.destinationLabel.text = model.destination;
    self.styleLabel.text = model.tag_name;
    self.descriptionLabel.text = model.top_name;
    self.priceLabel.text = model.price;
    self.suffixLabel.text = model.price_suffix;
    self.barginLabel.text = model.red_str;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
