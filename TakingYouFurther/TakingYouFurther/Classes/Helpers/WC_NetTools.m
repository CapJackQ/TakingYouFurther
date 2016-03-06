//
//  WC_NetTools.m
//  iOS9 异步新方法
//
//  Created by lanou3g on 15/12/29.
//  Copyright © 2015年 WangChao. All rights reserved.
//

#import "WC_NetTools.h"

@implementation WC_NetTools

+ (void)solveDataWithUrl:(NSString *)stringUrl HttpMethod:(NSString *)method HttpBody:(NSString *)stringBody revokeBlock:(Block)block {
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSString *Smethod = [method uppercaseString];
    if ([Smethod isEqualToString:@"POSt"]) {
        [request setHTTPMethod:Smethod];
        NSData *data = [stringBody dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:data];
    }else if ([Smethod isEqualToString:@"GET"]) {
        
    }else {
        @throw [NSException exceptionWithName:@"Error" reason:@"Parameter" userInfo:nil];
    }
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        block(data);
    }];
    
    [task resume];
}

@end
