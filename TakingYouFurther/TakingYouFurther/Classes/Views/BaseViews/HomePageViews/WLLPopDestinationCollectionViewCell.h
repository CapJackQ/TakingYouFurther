//
//  WLLPopDestinationCollectionViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//


/// 热门目的地 collection item
#import <UIKit/UIKit.h>
@class WLLDestinationModel;
@class WLLMoreOverModel;

@interface WLLPopDestinationCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) WLLDestinationModel *model;
@property (nonatomic, strong) WLLMoreOverModel *Mmodel;

@end
