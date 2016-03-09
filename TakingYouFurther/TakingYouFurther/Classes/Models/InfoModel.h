//
//  InfoModel.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface InfoModel : NSObject
@property (nonatomic, strong) NSArray *album_example;
@property (nonatomic, copy) NSString *header_img;
@property (nonatomic, copy) NSString *did;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger num_album;
@property (nonatomic, strong) NSDictionary *num_url;
@property (nonatomic, strong) NSDictionary *parent;
@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lng;


@end
