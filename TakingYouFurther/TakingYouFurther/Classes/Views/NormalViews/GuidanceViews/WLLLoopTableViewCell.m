//
//  WLLLoopTableViewCell.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/9.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLLoopTableViewCell.h"
#import "UIImageView+WebCache.h"

#define kWidth CGRectGetWidth([UIScreen mainScreen].bounds)

@interface WLLLoopTableViewCell ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *firstImage;
@property (strong, nonatomic) IBOutlet UIImageView *secImage;
@property (strong, nonatomic) IBOutlet UIImageView *thirdImage;
@property (strong, nonatomic) IBOutlet UIImageView *fourthImage;
@property (strong, nonatomic) IBOutlet UIImageView *fifthImage;
@property (strong, nonatomic) IBOutlet UIImageView *sixthImage;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;


@end

@implementation WLLLoopTableViewCell

- (void)awakeFromNib {
    self.pageControl.layer.masksToBounds = YES;
    self.pageControl.layer.cornerRadius = self.frame.size.height / 2;
    self.scrollView.delegate = self;
    
    self.scrollView.contentOffset = CGPointMake(kWidth, 0);
    
    [self addPictures];
}

-(void)addPictures {
    [self.firstImage sd_setImageWithURL:[NSURL URLWithString:@"http://file107.mafengwo.net/s9/M00/40/E3/wKgBs1bHCJCALan1AAGA8YuzdLc15.jpeg?imageMogr2%2Fstrip%7CimageMogr2%2Fthumbnail%2F%21750x240r%2Fgravity%2FCenter%2Fcrop%2F%21750x240%2Fquality%2F90"]];
    [self.secImage sd_setImageWithURL:[NSURL URLWithString:@"http://file104.mafengwo.net/s9/M00/8A/74/wKgBs1bP6QqAHSn1AAHG6Ex7zv029.jpeg?imageMogr2%2Fstrip%7CimageMogr2%2Fthumbnail%2F%21750x240r%2Fgravity%2FCenter%2Fcrop%2F%21750x240%2Fquality%2F90"]];
    [self.thirdImage sd_setImageWithURL:[NSURL URLWithString:@"http://file110.mafengwo.net/s9/M00/A6/01/wKgBs1bK_caAdFebAAE3_lr-cyg541.gif?imageMogr2%2Fstrip%7CimageMogr2%2Fthumbnail%2F%21750x240r%2Fgravity%2FCenter%2Fcrop%2F%21750x240%2Fquality%2F90"]];
    [self.fourthImage sd_setImageWithURL:[NSURL URLWithString:@"http://file112.mafengwo.net/s9/M00/9A/11/wKgBs1bFijeAJ2sIAAFywv6kiUc45.jpeg?imageMogr2%2Fstrip%7CimageMogr2%2Fthumbnail%2F%21750x240r%2Fgravity%2FCenter%2Fcrop%2F%21750x240%2Fquality%2F90"]];
    [self.fifthImage sd_setImageWithURL:[NSURL URLWithString:@"http://file107.mafengwo.net/s9/M00/40/E3/wKgBs1bHCJCALan1AAGA8YuzdLc15.jpeg?imageMogr2%2Fstrip%7CimageMogr2%2Fthumbnail%2F%21750x240r%2Fgravity%2FCenter%2Fcrop%2F%21750x240%2Fquality%2F90"]];
    [self.sixthImage sd_setImageWithURL:[NSURL URLWithString:@"http://file104.mafengwo.net/s9/M00/8A/74/wKgBs1bP6QqAHSn1AAHG6Ex7zv029.jpeg?imageMogr2%2Fstrip%7CimageMogr2%2Fthumbnail%2F%21750x240r%2Fgravity%2FCenter%2Fcrop%2F%21750x240%2Fquality%2F90"]];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger offSet = scrollView.contentOffset.x / kWidth;
    
    if (offSet == 5) {
        
        self.pageControl.currentPage = 0;
        self.scrollView.contentOffset = CGPointMake(kWidth, 0);
        return;
    }
    
    if (offSet == 0) {
        self.pageControl.currentPage = 3;
        self.scrollView.contentOffset = CGPointMake(4 * kWidth, 0);
        return;
    }
    self.pageControl.currentPage = offSet - 1;
}

- (IBAction)clickAction:(UIPageControl *)sender {
    self.scrollView.contentOffset = CGPointMake((sender.currentPage + 1)*kWidth, 0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
