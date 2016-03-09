//
//  WLLDestinationViewController.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/2/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLLDestinationViewController : UIViewController
@property (nonatomic, strong) NSString *mddUrl;
@property (nonatomic, strong) UISearchBar *searchBar;

- (void)setSearchVCHidden:(BOOL)hidden;

- (void)loadData:(NSString *)url;

@end
