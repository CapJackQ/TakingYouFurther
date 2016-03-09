//
//  CateTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "CateTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation CateTableViewCell

- (void)setModelArr:(NSMutableArray *)modelArr {
    _modelArr = modelArr;
    [self.iv1 sd_setImageWithURL:[NSURL URLWithString:((CateModel *)modelArr[0]).img_url]];
    self.labelCate1.text = ((CateModel *)modelArr[0]).title;
    
    NSString *str1 = ((CateModel *)modelArr[0]).sub_title;
    NSArray *arr1 = [str1 componentsSeparatedByString:@">"];
    NSString *dStr1 = arr1[1];
    NSMutableString *mStr1 = [NSMutableString string];
    
    for (int i = 0; i < dStr1.length; i++) {
        if ([dStr1 characterAtIndex:i] == '<') {
            break;
        }
        
        [mStr1 appendFormat:@"%c", [dStr1 characterAtIndex:i]];
        
    }
    self.labelNumOfArea1.text = mStr1;
    
    
    
    
    [self.iv2 sd_setImageWithURL:[NSURL URLWithString:((CateModel *)modelArr[1]).img_url]];
    self.labelCate2.text = ((CateModel *)modelArr[1]).title;
    
    NSString *str2 = ((CateModel *)modelArr[1]).sub_title;
    NSArray *arr2 = [str2 componentsSeparatedByString:@">"];
    NSString *dStr2 = arr2[1];
    NSMutableString *mStr2 = [NSMutableString string];
    
    for (int i = 0; i < dStr2.length; i++) {
        if ([dStr2 characterAtIndex:i] == '<') {
            break;
        }
        
        [mStr2 appendFormat:@"%c", [dStr2 characterAtIndex:i]];
        
    }
    self.labelNumOfArea2.text = mStr2;
    
    
    
    
    
    [self.iv3 sd_setImageWithURL:[NSURL URLWithString:((CateModel *)modelArr[2]).img_url]];
    self.labelCate3.text = ((CateModel *)modelArr[2]).title;
    
    NSString *str3 = ((CateModel *)modelArr[2]).sub_title;
    NSArray *arr3 = [str3 componentsSeparatedByString:@">"];
    NSString *dStr3 = arr3[1];
    NSMutableString *mStr3 = [NSMutableString string];
    
    for (int i = 0; i < dStr3.length; i++) {
        if ([dStr3 characterAtIndex:i] == '<') {
            break;
        }
        
        [mStr3 appendFormat:@"%c", [dStr3 characterAtIndex:i]];
        
    }
    self.labelNumOfArea3.text = mStr3;

    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
