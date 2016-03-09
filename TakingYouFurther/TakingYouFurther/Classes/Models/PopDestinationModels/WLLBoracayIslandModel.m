//
//  WLLBoracayIslandModel.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/8.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLBoracayIslandModel.h"

@implementation WLLBoracayIslandModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.nid = value;
    }
}

@end
