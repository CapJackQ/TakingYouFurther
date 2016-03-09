//
//  ImageCollectionViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/6.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImgeModel.h"
@interface ImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIWebView *wv;

@property (nonatomic, strong) ImgeModel *model;

@end
