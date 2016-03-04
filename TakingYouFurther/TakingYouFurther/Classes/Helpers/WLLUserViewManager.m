//
//  WLLUserViewManager.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLUserViewManager.h"
#import "MJExtension.h"


static WLLUserViewManager *manager = nil;

@implementation WLLUserViewManager

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[WLLUserViewManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _isLogIning = NO;
    }
    return self;
}

- (void)parseDataWithUrl:(NSString *)url {
    
}

@end
