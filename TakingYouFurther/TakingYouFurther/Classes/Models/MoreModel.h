//
//  MoreModel.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoreModel : NSObject
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *file;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *unique;
@property (nonatomic, assign) NSInteger utime;
@property (nonatomic, assign) NSInteger size;

@end
