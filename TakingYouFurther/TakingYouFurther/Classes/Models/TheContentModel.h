//
//  TheContentModel.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>


@class TheImageModel;

@interface TheContentModel : NSObject

@property (nonatomic, strong) TheImageModel *image;

@property (nonatomic, assign) NSInteger one_line;

@property (nonatomic, copy) NSString *text;

@end


