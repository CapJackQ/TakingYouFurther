//
//  LiveCollectionViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveModel.h"
@interface LiveCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iv;
@property (weak, nonatomic) IBOutlet UILabel *labelArea;
@property (weak, nonatomic) IBOutlet UILabel *labelPercent;

@property (weak, nonatomic) IBOutlet UILabel *labelRand;

@property (nonatomic, strong) LiveModel *model;

@end
