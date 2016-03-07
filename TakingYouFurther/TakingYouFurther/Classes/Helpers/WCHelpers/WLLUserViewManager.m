//
//  WLLUserViewManager.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLUserViewManager.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "WC_NetTools.h"

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

- (void)parseDataWithUrl:(NSString *)url finishInvokeBlock:(void (^)())block {
//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    NSDictionary *dic = @{ @"format" : @"json" };
//    
//    [session GET:url parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        self.firstModel = [NOfiticationRadioFirstModel mj_objectWithKeyValues:responseObject];
//        NSLog(@"kkkkkk%@", responseObject);
//        block();
//        NSLog(@"DDDDDD%ld", self.firstModel.is_array);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@", error);
//    }];
    [WC_NetTools solveDataWithUrl:url HttpMethod:@"GET" HttpBody:nil revokeBlock:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        self.firstModel = [NOfiticationRadioFirstModel mj_objectWithKeyValues:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
        });
    }];
    
    
}
    


@end
