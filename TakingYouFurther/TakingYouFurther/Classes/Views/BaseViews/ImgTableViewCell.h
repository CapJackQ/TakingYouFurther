//
//  ImgTableViewCell.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoModel.h"
@interface ImgTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iv1;
@property (weak, nonatomic) IBOutlet UIImageView *iv2;
@property (weak, nonatomic) IBOutlet UIImageView *iv3;
@property (weak, nonatomic) IBOutlet UILabel *numOfPic;
@property (nonatomic, strong) InfoModel *model;

@end
