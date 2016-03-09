//
//  ImageCollectionViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/6.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation ImageCollectionViewCell


- (void)setModel:(ImgeModel *)model {
    _model = model;
    
    self.wv.dataDetectorTypes = UIDataDetectorTypeAll;
    [self.wv loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:model.hoverurl]]];
    
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

@end
