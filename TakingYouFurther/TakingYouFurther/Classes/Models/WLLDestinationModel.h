//
//  WLLDestinationModel.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLLDestinationModel : NSObject

@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *thumbnail;
@property (nonatomic, copy) NSString *sub_title;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *price_suffix;
@property (nonatomic, copy) NSString *jump_url;

@end
