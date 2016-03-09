//
//  TabImageView.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/7.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "TabImageView.h"

@implementation TabImageView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
