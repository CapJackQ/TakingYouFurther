//
//  NOfiticationRadioFirstModel.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TheDataModel.h"

@interface NOfiticationRadioFirstModel : NSObject

@property (nonatomic, assign) NSInteger is_array;

@property (nonatomic, strong) TheDataModel *data;

@property (nonatomic, assign) NSInteger rc;

@property (nonatomic, copy) NSString *rm;

@end


