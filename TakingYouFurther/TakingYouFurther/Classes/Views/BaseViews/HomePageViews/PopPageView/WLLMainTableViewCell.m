//
//  WLLMainTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/5.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLMainTableViewCell.h"

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


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
