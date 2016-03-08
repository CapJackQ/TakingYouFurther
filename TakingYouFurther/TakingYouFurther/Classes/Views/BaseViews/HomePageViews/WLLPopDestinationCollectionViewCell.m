//
//  WLLPopDestinationCollectionViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLPopDestinationCollectionViewCell.h"
#import "WLLDestinationModel.h"
#import "UIImageView+WebCache.h"
#import "WLLMoreOverModel.h"

@interface WLLPopDestinationCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *destinationImage;
@property (strong, nonatomic) IBOutlet UILabel *destinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *actionLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@property (strong, nonatomic) IBOutlet UILabel *suffixLabel;

@end


@implementation WLLPopDestinationCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(WLLDestinationModel *)model {
    
    _model = model;
    
    [self.destinationImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.thumbnail]]];
    self.destinationLabel.text = model.title;
    self.actionLabel.text = model.sub_title;
    self.priceLabel.text = model.price;
    self.suffixLabel.text = model.price_suffix;
}

-(void)setMmodel:(WLLMoreOverModel *)Mmodel {
    _Mmodel = Mmodel;
    
    [self.destinationImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", Mmodel.icon]]];
    
    self.destinationLabel.text = Mmodel.title;
    self.actionLabel.text = Mmodel.sub_title;
    self.priceLabel.text = Mmodel.price;
    self.suffixLabel.text = Mmodel.price_suffix;
}

@end
