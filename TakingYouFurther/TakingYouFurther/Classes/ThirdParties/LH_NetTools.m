//
//  LH_NetTools.m
//  UILesson17_NetWorking2
//
//  Created by lanou3g on 15/12/29.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "LH_NetTools.h"

@implementation LH_NetTools



+ (void)solveDataWithUrl:(NSString *)StringUrl httpMethod:(NSString *)method httpBody:(NSString *)stringBody revokeBlock:(DataBlock)block {
    NSURL *url = [NSURL URLWithString:StringUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
   // 将所有的字母转换成大写
    NSString *SMethod = [method uppercaseString];
    if ([@"POST" isEqualToString:SMethod]) {
        [request setHTTPMethod:SMethod];
        NSData *dataBody = [stringBody dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:dataBody];
        
    } else if ([@"GET" isEqualToString:SMethod]) {
        
    } else {
        
        @throw [NSException exceptionWithName:@"Param Error" reason:@"方法类型参数错误" userInfo:nil];
        return;
        
    }
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        block(data);
        
    }];
}


+ (void)SessionDataWithUrl:(NSString *)stringUrl httpMethod:(NSString *)method httpBody:(NSString *)stringBody revokeBlock:(DataSessionBlock)block {
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSString *SMethod = [method uppercaseString];
    if ([SMethod isEqualToString:@"POST"]) {
        [request setHTTPMethod:SMethod];
        NSData *dataBody = [stringBody dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:dataBody];
        
    } else if ([SMethod isEqualToString:@"GET"]) {
        
    } else {
        @throw [NSException exceptionWithName:@"Error" reason:@"方法参数错误" userInfo:nil];
        return;
        
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        block(data);
        
    }];
    
    [task resume];
    
    
    
    
}







+ (void)SessionDownLoadWithUrl:(NSString *)stringUrl revokeBlock:(ImageSolveBlock)block {
    // 1 创建url
    NSURL *url = [NSURL URLWithString:stringUrl];
    // 2 创建请求对象
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    // 3 创建会话
    NSURLSession *session = [NSURLSession sharedSession];
    // 4 创建任务
    NSURLSessionDownloadTask *tast = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *ImageData = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:ImageData];
        
        // 从子线程回到主线程进行界面更新
        dispatch_async(dispatch_get_main_queue(), ^{
            block(image);
            
        });
        
    }];
    // 启动任务
    [tast resume];
    
}








@end
