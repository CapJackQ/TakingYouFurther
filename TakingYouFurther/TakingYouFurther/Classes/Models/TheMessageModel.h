//
//  TheMessageModel.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TheContentModel.h"
#import "TheExtModel.h"

@interface TheMessageModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) TheContentModel *content;

@property (nonatomic, strong) TheExtModel *ext;

@end


