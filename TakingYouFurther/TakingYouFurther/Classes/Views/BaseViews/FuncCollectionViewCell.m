//
//  FuncCollectionViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "FuncCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation FuncCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupItem];
    }
    return self;
}

- (void)setupItem {
    self.iv = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25, self.bounds.size.width - 50, self.bounds.size.width - 50)];
    self.iv.layer.masksToBounds = YES;
    self.iv.layer.cornerRadius = (self.bounds.size.width - 50) / 2;
    
    self.labelType = [[UILabel alloc] initWithFrame:CGRectMake(25, self.bounds.size.width, self.bounds.size.width - 50, 20)];
    self.labelType.textAlignment = NSTextAlignmentCenter;
    self.labelType.font = [UIFont systemFontOfSize:17 weight:0.3];
    self.labelType.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.labelType];
    [self.contentView addSubview:self.iv];
    
}

- (void)setModel:(FuncModel *)model {
    _model = model;
    [self.iv sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    self.labelType.text = model.title;
    
}




@end
