//
//  WLLTodayNotesModel.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLTodayNotesModel.h"

@implementation WLLTodayNotesModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"title"]) {
        
        self.note_title = value;
    }
    
    if ([key isEqualToString:@"name"]) {
        self.user_name = value;
    }
    
}

@end
