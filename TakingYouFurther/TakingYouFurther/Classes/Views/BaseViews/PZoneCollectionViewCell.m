//
//  PZoneCollectionViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "PZoneCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation PZoneCollectionViewCell

- (void)setModel:(PZoneModel *)model {
    _model = model;
    [self.iv sd_setImageWithURL:[NSURL URLWithString:model.img_url]];
    self.labelZone.text = model.title;
    
    NSString *str = model.sub_title;
    NSArray *arr = [str componentsSeparatedByString:@">"];
    NSString *dStr = arr[1];
    NSMutableString *mStr = [NSMutableString string];
    
    for (int i = 0; i < dStr.length; i++) {
        if ([dStr characterAtIndex:i] == '<') {
            break;
        }
        
        [mStr appendFormat:@"%c", [dStr characterAtIndex:i]];
        
    }

    self.labelFarAway.text = mStr;
    
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

@end
