//
//  MoreTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "MoreTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation MoreTableViewCell

- (void)setModel:(MoreModel *)model {
    _model = model;
    [self.iv sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    self.labelName.text = model.title;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateFormat:@"yyyy.MM.dd"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:model.utime];
    NSString *timeStr = [formatter stringFromDate:date];
    self.labelDate.text = timeStr;
    
    NSString *briefStr = [NSString string];
    for (NSString *str in model.unique) {
        briefStr = [briefStr stringByAppendingString:[NSString stringWithFormat:@"%@ ", str]];
        
    }
    self.labelBrief.text = briefStr;
    
    self.downBtn.layer.masksToBounds = YES;
    self.downBtn.layer.cornerRadius = (SWidth / 8.0) - 40;
    
    NSInteger size = model.size;
    double dsize = (size * 1.0) / 1000000;
    
    self.downLabel.text = [NSString stringWithFormat:@"%.2fM", dsize];
    
    [self.downBtn addTarget:self action:@selector(downAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


int count = 0;

- (void)downAction:(UIButton *)sender {
    count++;
    if (count % 2 == 1) {
        [sender setImage:[UIImage imageNamed:@"down1"] forState:UIControlStateNormal];
        self.downLabel.text = @"暂停";
        
    } else {
        [sender setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        self.downLabel.text = @"下载";
        
    }
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
