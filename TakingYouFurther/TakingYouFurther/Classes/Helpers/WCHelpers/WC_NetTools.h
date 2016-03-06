//
//  WC_NetTools.h
//  iOS9 异步新方法
//
//  Created by lanou3g on 15/12/29.
//  Copyright © 2015年 WangChao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Block)(NSData *data);
@interface WC_NetTools : NSObject

+ (void)solveDataWithUrl:(NSString *)stringUrl HttpMethod:(NSString *)method HttpBody:(NSString *)stringBody revokeBlock:(Block)block;


@end
