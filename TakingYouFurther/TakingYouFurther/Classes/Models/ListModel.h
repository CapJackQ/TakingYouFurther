//
//  ListModel.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>


@class TheMessageModel;
@class TheSenderModel;

@interface ListModel : NSObject

@property (nonatomic, assign) NSInteger is_folded;

@property (nonatomic, strong) TheMessageModel *message;

@property (nonatomic, strong) TheSenderModel *sender;

@property (nonatomic, copy) NSString *url;

@end



