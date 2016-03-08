//
//  WLLRecommendDestinationCollectionViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WLLRecommendModel;
@class WLLMoreCheckModel;

@interface WLLRecommendDestinationCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) WLLRecommendModel *model;

@property (nonatomic, strong) WLLMoreCheckModel *Mmodel;

@end
