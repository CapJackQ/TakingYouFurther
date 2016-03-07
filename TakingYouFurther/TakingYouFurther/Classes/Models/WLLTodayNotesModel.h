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

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *sub_title_text;
@property (nonatomic, copy) NSString *sub_title_url;
@property (nonatomic, copy) NSString *note_title;
@property (nonatomic, copy) NSString *thumbnail;
@property (nonatomic, copy) NSString *jump_url;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, copy) NSString *logo;

@property (nonatomic, strong) NSDictionary *user;
@property (nonatomic, strong) NSDictionary *note;
@property (nonatomic, copy) NSString *name;

@end
