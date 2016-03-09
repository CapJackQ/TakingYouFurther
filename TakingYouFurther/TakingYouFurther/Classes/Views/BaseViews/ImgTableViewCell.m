//
//  ImgTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ImgTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation ImgTableViewCell

- (void)setModel:(InfoModel *)model {
    _model = model;
    [self.iv1 sd_setImageWithURL:[NSURL URLWithString:model.album_example[0]]];
    [self.iv2 sd_setImageWithURL:[NSURL URLWithString:model.album_example[1]]];
    [self.iv3 sd_setImageWithURL:[NSURL URLWithString:model.album_example[2]]];
    self.numOfPic.text = [NSString stringWithFormat:@"%ld", model.num_album];
    
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
