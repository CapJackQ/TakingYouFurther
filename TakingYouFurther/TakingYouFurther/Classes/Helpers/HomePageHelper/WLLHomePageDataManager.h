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
@class WLLPopModel;
@class WLLMoreOverModel;
@class WLLMoreCheckModel;
@class WLLBoracayIslandModel;

@interface WLLHomePageDataManager : NSObject


@property (nonatomic, strong) NSMutableArray *pathArray;

@property (nonatomic, strong) NSMutableArray *monthArray;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, assign) NSInteger path;

/**
 *  单例
 *
 *  @return 单例
 */
+(instancetype)shareInstance;

/*----------------------------------首页-----------------------------*/

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

-(NSInteger)countOfModelArray;

/*----------------------------------热门目的地-----------------------------*/

/**
 *  根据url请求数据
 *
 *  @param url      url
 *  @param finished 回调刷新页面
 */
-(void)requestPopDestinationDataWithUrl:(NSString *)url didFinished:(void(^)())finished;

/**
 *  返回数组个数
 *
 *  @return 返回数组个数
 */
-(NSInteger)countOfPopDestinationArray;

/**
 *  根据下标返回model
 *
 *  @param index 下标
 *
 *  @return 返回model
 */
-(WLLPopModel *)popModelWithIndex:(NSInteger)index;



/*----------------------------------查看更多-----------------------------*/

/**
 *  根据url请求数据
 *
 *  @param url      url
 *  @param finished 回调刷新页面
 */
-(void)requestMoreOverDataWithUrl:(NSString *)url finished:(void(^)())finished;

/**
 *  返回数组个数
 *
 *  @return 返回数组个数
 */
-(NSInteger)countOfMoreOverArray;

/**
 *  根据下标返回model
 *
 *  @param index 下标
 *
 *  @return 返回model
 */
-(WLLMoreOverModel *)moreOverModelWithIndex:(NSInteger)index;


-(void)requestMoreCheckDataWithUrl:(NSString *)url finished:(void(^)())finished;

-(NSInteger)countOfMoreCheckArray;

-(WLLMoreCheckModel *)moreCheckModelWithIdex:(NSInteger)index;


-(NSInteger)countOfMonthDataArray;
-(WLLBoracayIslandModel *)monthModelWithIndex:(NSInteger)index;


@end
