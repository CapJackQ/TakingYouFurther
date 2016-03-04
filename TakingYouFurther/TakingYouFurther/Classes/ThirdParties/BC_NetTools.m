//
//  BC_NetTools.m
//  UILesson17_NetWorking2
//
//  Created by lanou3g on 15/12/29.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "BC_NetTools.h"

@implementation BC_NetTools

+(void)solveDataWithUrl:(NSString *)stringUrl httpMethod:(NSString *)method httpBody:(NSString *)stringBody revokeBlock:(DataBlock)block {
    
    NSURL *url = [NSURL URLWithString:stringUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    // 将所有的字母转换成大写
    NSString *SMethod = [method uppercaseString];
    
    if ([@"POST" isEqualToString:SMethod]) {
        [request setHTTPMethod:SMethod];
        NSData *bodyData = [stringBody dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:bodyData];
    } else if ([@"GET" isEqualToString:SMethod]) {
        // 空的时候，默认为get
    } else {
        @throw [NSException exceptionWithName:@"BC Param Error" reason:@"Wrong Method Type Exception" userInfo:nil];
        return;
    }
    
    // 发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        block(data);
    }];
}



// session 新方法封装
+(void)sessionDataWithUrl:(NSString *)stringUrl HttpMethod:(NSString *)method HttpBody:(NSString *)stringBody revokeBlock:(SessionDataBlock)block {
    
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *uppMethod = [method uppercaseString];
    
    if ([@"POST" isEqualToString:uppMethod]) {
        [request setHTTPMethod:uppMethod];
        NSData *dataBody = [stringBody dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:dataBody];
    } else if ([@"GET" isEqualToString:uppMethod]) {
        
    } else {
        @throw [NSException exceptionWithName:@"BC Param Error" reason:@"Wrong Method Type Exception" userInfo:nil];
        return;
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        block(data);
    }];
    [task resume];
}

+(void)SessionDownloadWithUrl:(NSString *)stringUrl revokeBlock:(ImageSolveBlock)block {
    // 1.创建url
    NSURL *url = [NSURL URLWithString:stringUrl];
    // 2.创建request请求对象
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    // 3.创建session
    NSURLSession *session = [NSURLSession sharedSession];
    // 4.创建任务
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSData *ImageData = [NSData dataWithContentsOfURL:location];
        
        UIImage *image = [UIImage imageWithData:ImageData];
        
        // 从子线程回到主线程进行界面更新 iOS界面更新只能在主线程
        // 给线程添加任务
        dispatch_async(dispatch_get_main_queue(), ^{
            block(image);
        });
        
    }];
    
    // 启动任务
    [task resume];
}


@end










