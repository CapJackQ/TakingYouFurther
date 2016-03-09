//
//  WLLGuidanceCollectionViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//


/// 找攻略 显示内容
#import <UIKit/UIKit.h>
@class WLLGuidanceModel;

@interface WLLGuidanceCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *guidanceLabel;

@property (nonatomic, strong) WLLGuidanceModel *model;

@end
