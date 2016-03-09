//
//  FuncCollectionViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FuncModel.h"
@interface FuncCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *iv;
@property (nonatomic, strong)UILabel *labelType;
@property (nonatomic, strong) FuncModel *model;

@end
