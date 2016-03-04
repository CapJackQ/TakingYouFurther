//
//  BC_NetTools.h
//  UILesson17_NetWorking2
//
//  Created by lanou3g on 15/12/29.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^DataBlock)(NSData *data);

typedef void(^SessionDataBlock)(NSData *data);

typedef void(^ImageSolveBlock)(UIImage *image);

@interface BC_NetTools : NSObject


// 封装旧方法
+(void)solveDataWithUrl:(NSString *)stringUrl httpMethod:(NSString *)method httpBody:(NSString *)stringBody revokeBlock:(DataBlock)block;



// 新方法
// 如果是解析
+(void)sessionDataWithUrl:(NSString *)stringUrl HttpMethod:(NSString *)method HttpBody:(NSString *)stringBody revokeBlock:(SessionDataBlock)block;


// 如果是下载图片
+(void)SessionDownloadWithUrl:(NSString *)stringUrl revokeBlock:(ImageSolveBlock)block;

@end
