//
//  LogInfirstCellModel.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/8.
//  Copyright © 2016年 lanou3g. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LogInfirstCellModel : NSObject

@property (nonatomic, strong) UIImage *headImage;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, assign) NSInteger focusNumber;

@property (nonatomic, assign) NSInteger followers;

@end
