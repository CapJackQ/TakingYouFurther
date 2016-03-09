//
//  PZoneCollectionViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PZoneModel.h"
@interface PZoneCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iv;
@property (weak, nonatomic) IBOutlet UILabel *labelZone;
@property (weak, nonatomic) IBOutlet UILabel *labelFarAway;
@property (nonatomic, strong) PZoneModel *model;


@end
