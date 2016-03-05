//
//  WLLPopDstinationTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLPopDstinationTableViewCell.h"
#import "WLLDestinationModel.h"

@interface WLLPopDstinationTableViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *popLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIButton *titleButton;

@end

@implementation WLLPopDstinationTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(WLLDestinationModel *)model {
    
    _model = model;
    self.titleLabel.text = model.data[@"title"];
    [self.titleButton setTitle:model.data[@"sub_title_text"] forState:UIControlStateNormal];
}
- (IBAction)moreCheckAction:(UIButton *)sender {
    
    if (_delegate && [_delegate respondsToSelector:@selector(pushViewController)]) {
        [self.delegate pushViewController];
        NSLog(@"00");
    }
    NSLog(@"00-11");
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
