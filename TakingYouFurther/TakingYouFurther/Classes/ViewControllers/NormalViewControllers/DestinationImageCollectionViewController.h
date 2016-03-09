//
//  DestinationImageCollectionViewController.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/6.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^JumpBlock)(BOOL jumpState);
@interface DestinationImageCollectionViewController : UICollectionViewController
@property (nonatomic, copy) JumpBlock jumpblock;
@end
