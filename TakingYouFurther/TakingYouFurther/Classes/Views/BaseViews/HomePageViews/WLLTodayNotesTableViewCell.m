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
    
    self.todayLabel.text = model.data[@"title"];
    self.yestodayLabel.text = model.data[@"sub_title_text"];
    self.nameLabel.text = model.user[@"name"];
    self.destinationLabel.text = model.name;
    self.titleLabel.text = model.note[@"title"];
    
    [self.todayImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.note[@"thumbnail"]]]];
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.note[@"logo"]]]];
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
