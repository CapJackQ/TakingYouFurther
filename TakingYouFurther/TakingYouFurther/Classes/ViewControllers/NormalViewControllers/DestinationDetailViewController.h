//
//  DestinationDetailViewController.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/5.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^JumpBlock)(BOOL jumpState);

@interface DestinationDetailViewController : UIViewController
@property (nonatomic, strong) NSString *jumpUrl;
@property (nonatomic, copy) JumpBlock jumpblock;

@end
