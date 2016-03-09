//
//  TravelModel.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TravelModel : NSObject
@property (nonatomic, strong) NSDictionary *img;
@property (nonatomic, copy) NSString *jump_url;
@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lng;
@property (nonatomic, strong) NSDictionary *owner;

@end
