//
//  GoTableViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoModel.h"
@interface GoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iv;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelNumOfArea;
@property (weak, nonatomic) IBOutlet UILabel *labelDescribe;
@property (nonatomic, strong) GoModel *model;

@end
