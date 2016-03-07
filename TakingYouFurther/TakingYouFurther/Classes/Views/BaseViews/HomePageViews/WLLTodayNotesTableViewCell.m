//
//  WLLTodayNotesTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLTodayNotesTableViewCell.h"
#import "WLLTodayNotesModel.h"
#import "UIImageView+WebCache.h"

#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)

@interface WLLTodayNotesTableViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *todayLabel;
@property (strong, nonatomic) IBOutlet UILabel *yestodayLabel;
@property (strong, nonatomic) IBOutlet UIImageView *todayImage;
@property (strong, nonatomic) IBOutlet UIImageView *headImage;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *destinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation WLLTodayNotesTableViewCell

-(void)setModel:(WLLTodayNotesModel *)model {
    
    _model = model;
    
    self.todayLabel.text = model.title;
    self.yestodayLabel.text = model.sub_title_text;
    self.nameLabel.text = model.user_name;
    self.destinationLabel.text = model.name;
    self.titleLabel.text = model.note_title;
    
    [self.todayImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.thumbnail]]];
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.logo]]];
    
    self.headImage.layer.masksToBounds = YES;
    self.headImage.layer.cornerRadius = self.headImage.frame.size.height / 2;
}

-(CGSize)sizeThatFits:(CGSize)size {
    
    size = CGSizeMake(kWidth, self.titleLabel.frame.size.height + 100);
    return size;
}

-(void)setFrame:(CGRect)frame {
    frame.size = CGSizeMake(kWidth,CGRectGetMaxY(self.titleLabel.frame) + 100);
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
