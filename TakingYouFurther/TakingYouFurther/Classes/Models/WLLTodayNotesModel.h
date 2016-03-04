//
//  WLLTodayNotesModel.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WLLTodayNotesModel : NSObject

@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSDictionary *user;
@property (nonatomic, strong) NSDictionary *note;
@property (nonatomic, copy) NSString *name;

@end
