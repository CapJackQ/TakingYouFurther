//
//  WLLUserViewManager.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NOfiticationRadioFirstModel.h"
#import "TheDataModel.h"
#import "ListModel.h"
#import "TheMessageModel.h"
#import "TheContentModel.h"
#import "TheImageModel.h"
#import "TheExtModel.h"
#import "TheSenderModel.h"

@interface WLLUserViewManager : NSObject

@property (nonatomic, assign) BOOL isLogIning;

@property (nonatomic, strong) NOfiticationRadioFirstModel *firstModel;

#pragma mark - 单例

+ (instancetype)shareInstance;

#pragma mark - 网络请求

- (void)parseDataWithUrl:(NSString *)url finishInvokeBlock:(void (^)())block;

@end
