//
//  LH_NetTools.h
//  UILesson17_NetWorking2
//
//  Created by lanou3g on 15/12/29.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^DataBlock)(NSData *data);
typedef void (^ImageSolveBlock)(UIImage *image);
typedef void (^DataSessionBlock)(NSData *data);


@interface LH_NetTools : NSObject

// 封装的旧方法
+ (void)solveDataWithUrl:(NSString *)StringUrl httpMethod:(NSString *)method httpBody:(NSString *)stringBody revokeBlock:(DataBlock)block;


// 新方法的
// 如果是解析
// 自己写
+ (void)SessionDataWithUrl:(NSString *)stringUrl httpMethod:(NSString *)method httpBody:(NSString *)stringBody revokeBlock:(DataSessionBlock)block;








// 如果是下载图片
+ (void)SessionDownLoadWithUrl:(NSString *)stringUrl revokeBlock:(ImageSolveBlock)block;




@end
