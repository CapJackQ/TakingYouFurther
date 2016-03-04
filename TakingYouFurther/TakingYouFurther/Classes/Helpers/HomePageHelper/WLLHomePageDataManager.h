//
//  WLLHomePageDataManager.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WLLGuidanceModel;
@class WLLTodayNotesModel;
@class WLLDestinationModel;
@class WLLRecommendModel;

@interface WLLHomePageDataManager : NSObject

/**
 *  单例
 *
 *  @return 单例
 */
+(instancetype)shareInstance;

/**
 *  根据url来请求数据
 *
 *  @param url      数据接口
 *  @param finished 完成后回调
 */
-(void)requestHomePageDataWithUrl:(NSString *)url didFinished:(void(^)())finished;

/**
 *  数组根数
 *
 *  @return 返回数组个数
 */
-(NSInteger)countOfguidanceArray;

/**
 *  根据下标返回model
 *
 *  @param index cell index
 *
 *  @return 返回数据模型
 */
-(WLLGuidanceModel *)guidanceModelWithIdex:(NSInteger)index;

-(NSInteger)countOfTadayNotesArray;

-(WLLTodayNotesModel *)todayNotesModelWithIndex:(NSInteger)index;

-(NSInteger)countOfDestinationArray;

-(WLLDestinationModel *)destinationModelWithIndex:(NSInteger)index;

-(NSInteger)countOfRecommendArray;

-(WLLRecommendModel *)recommendModelWithIndex:(NSInteger)index;

@end
