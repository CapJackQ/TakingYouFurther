//
//  TheDataModel.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

#import "ListModel.h"

@interface TheDataModel : NSObject

@property (nonatomic, assign) NSInteger has_more;

@property (nonatomic, strong) NSArray *list;

@property (nonatomic, assign) NSInteger offset;

@end
