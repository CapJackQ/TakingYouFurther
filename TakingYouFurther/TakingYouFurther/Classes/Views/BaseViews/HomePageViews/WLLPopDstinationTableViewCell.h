//
//  WLLPopDstinationTableViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WLLDestinationModel;

@interface WLLPopDstinationTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UICollectionView *popDestinationCollectionView;

@property (nonatomic, strong) WLLDestinationModel *model;

@end
