//
//  RecommendedModel.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RecommendedModel : NSObject

@property (nonatomic, copy) NSString *recommendTitle;

@property (nonatomic, strong) UIImage *firstImage;
@property (nonatomic, strong) UIImage *secondImage;
@property (nonatomic, strong) UIImage *thirdImage;

@end
