//
//  GoModel.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "GoModel.h"

@implementation GoModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.did = [NSString stringWithFormat:@"%ld", [value longValue]];
    }
    
}

@end
