//
//  SaleModel.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaleModel : NSObject
@property (nonatomic, copy) NSString *discount;
@property (nonatomic, copy) NSString *jump_url;
@property (nonatomic, assign) NSInteger price_current;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *thumbnail;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *type;


@end
