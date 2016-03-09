//
//  TravelTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "TravelTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation TravelTableViewCell

- (void)setModelArr:(NSMutableArray *)modelArr {
    _modelArr = modelArr;
    [self.iv1 sd_setImageWithURL:[NSURL URLWithString:((TravelModel *)modelArr[0]).img[@"simg"]]];
    [self.pv1 sd_setImageWithURL:[NSURL URLWithString:((TravelModel *)modelArr[0]).owner[@"logo"]]];
    self.pv1.layer.masksToBounds = YES;
    self.pv1.layer.cornerRadius = 10;
    
    [self.iv2 sd_setImageWithURL:[NSURL URLWithString:((TravelModel *)modelArr[1]).img[@"simg"]]];
    [self.pv2 sd_setImageWithURL:[NSURL URLWithString:((TravelModel *)modelArr[1]).owner[@"logo"]]];
    self.pv2.layer.masksToBounds = YES;
    self.pv2.layer.cornerRadius = 10;

    [self.iv3 sd_setImageWithURL:[NSURL URLWithString:((TravelModel *)modelArr[2]).img[@"simg"]]];
    [self.pv3 sd_setImageWithURL:[NSURL URLWithString:((TravelModel *)modelArr[2]).owner[@"logo"]]];
    self.pv3.layer.masksToBounds = YES;
    self.pv3.layer.cornerRadius = 10;
    
    
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
