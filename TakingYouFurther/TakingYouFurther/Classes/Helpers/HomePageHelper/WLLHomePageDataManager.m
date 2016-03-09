//
//  WLLHomePageDataManager.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/4.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLHomePageDataManager.h"
#import "BC_NetTools.h"
#import "WLLGuidanceModel.h"
#import "WLLTodayNotesModel.h"
#import "WLLDestinationModel.h"
#import "WLLRecommendModel.h"
#import "Model.h"
#import "WLLPopModel.h"
#import "WLLMoreOverModel.h"
#import "WLLMoreCheckModel.h"
#import "WLLBoracayIslandModel.h"

@interface WLLHomePageDataManager ()

@property (nonatomic, strong) NSMutableArray *guidanceArray;
@property (nonatomic, strong) NSMutableArray *todayNotesArray;
@property (nonatomic, strong) NSMutableArray *destinationArray;
@property (nonatomic, strong) NSMutableArray *recommendArray;
@property (nonatomic, strong) NSMutableArray *popDestArray;
@property (nonatomic, strong) NSMutableArray *moreCheckArray;

@property (nonatomic, strong) NSMutableArray *moreOverArray;


@property (nonatomic, strong) NSMutableArray *modelArray;

@property (nonatomic, strong) NSMutableArray *monthDataArray;

@end

static WLLHomePageDataManager *manager = nil;

@implementation WLLHomePageDataManager

+(instancetype)shareInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[WLLHomePageDataManager alloc] init];
    });
    return manager;
}

-(instancetype)init {
    
    [self addPopDestPathArray];
    [self addRecoPathArray];
    return self;
}

-(void)addRecoPathArray {
    NSString *pathJan = [[NSBundle mainBundle] pathForResource:@"Jan" ofType:@"json"];
    NSString *pathFeb = [[NSBundle mainBundle] pathForResource:@"Feb" ofType:@"json"];
    NSString *pathMar = [[NSBundle mainBundle] pathForResource:@"Mar" ofType:@"json"];
    NSString *pathApr = [[NSBundle mainBundle] pathForResource:@"Apr" ofType:@"json"];
    NSString *pathMay = [[NSBundle mainBundle] pathForResource:@"May" ofType:@"json"];
    NSString *pathJun = [[NSBundle mainBundle] pathForResource:@"Jun" ofType:@"json"];
    NSString *pathJul = [[NSBundle mainBundle] pathForResource:@"Jul" ofType:@"json"];
    NSString *pathAug = [[NSBundle mainBundle] pathForResource:@"Aug" ofType:@"json"];
    NSString *pathNov = [[NSBundle mainBundle] pathForResource:@"Nov" ofType:@"json"];
    NSString *pathOct = [[NSBundle mainBundle] pathForResource:@"Oct" ofType:@"json"];
    NSString *pahtSep = [[NSBundle mainBundle] pathForResource:@"Sep" ofType:@"json"];
    NSString *pathDce = [[NSBundle mainBundle] pathForResource:@"Dce" ofType:@"json"];
    self.monthArray = @[pathMar, pathFeb, pathJan, pathApr, pathMay, pathJun, pathJul, pathAug, pahtSep, pathOct, pathNov, pathDce].mutableCopy;
}

-(void)addPopDestPathArray {
    NSString *pathTW = [[NSBundle mainBundle] pathForResource:@"pop" ofType:@"json"];
    NSString *pathCTD = [[NSBundle mainBundle] pathForResource:@"CTD" ofType:@"json"];
    NSString *pathDJ = [[NSBundle mainBundle] pathForResource:@"DJ" ofType:@"json"];
    NSString *pathHG = [[NSBundle mainBundle] pathForResource:@"HG" ofType:@"json"];
    NSString *pathCS = [[NSBundle mainBundle] pathForResource:@"CS" ofType:@"json"];
    NSString *pathTG = [[NSBundle mainBundle] pathForResource:@"TG" ofType:@"json"];
    NSString *pathWGK = [[NSBundle mainBundle] pathForResource:@"WGK" ofType:@"json"];
    NSString *pathQM = [[NSBundle mainBundle] pathForResource:@"QM" ofType:@"json"];
    NSString *pathPJD = [[NSBundle mainBundle] pathForResource:@"PJD" ofType:@"json"];
    NSString *pathDB = [[NSBundle mainBundle] pathForResource:@"DB" ofType:@"json"];
    NSString *pahtPL = [[NSBundle mainBundle] pathForResource:@"PL" ofType:@"json"];
    NSString *pathMEDF = [[NSBundle mainBundle] pathForResource:@"MEDF" ofType:@"json"];
    
    self.pathArray = @[pathTW, pathCTD, pathDJ, pathHG, pathCS, pathTG, pathWGK, pathQM, pathPJD, pathDB, pahtPL, pathMEDF].mutableCopy;
}

#pragma mark - 数组懒加载

-(NSMutableArray *)monthArray {
    if (!_monthArray) {
        _monthArray = [NSMutableArray array];
    }
    return _monthArray;
}

-(NSMutableArray *)pathArray {
    if (!_pathArray) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}

-(NSMutableArray *)guidanceArray {
    
    if (!_guidanceArray) {
        _guidanceArray = [NSMutableArray array];
    }
    return _guidanceArray;
}

-(NSMutableArray *)todayNotesArray {
    if (!_todayNotesArray) {
        _todayNotesArray = [NSMutableArray array];
    }
    return _todayNotesArray;
}

-(NSMutableArray *)destinationArray {
    
    if (!_destinationArray) {
        _destinationArray = [NSMutableArray array];
    }
    return _destinationArray;
}

-(NSMutableArray *)recommendArray {
    if (!_recommendArray) {
        _recommendArray = [NSMutableArray array];
    }
    return _recommendArray;
}

-(NSMutableArray *)modelArray {
    if (_modelArray == nil) {
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}

-(NSMutableArray *)popDestArray {
    if (_popDestArray == nil) {
        _popDestArray = [NSMutableArray array];
    }
    return _popDestArray;
}

-(NSMutableArray *)moreOverArray {
    if (!_moreOverArray) {
        _moreOverArray = [NSMutableArray array];
    }
    return _moreOverArray;
}

-(NSMutableArray *)moreCheckArray {
    if (!_moreCheckArray) {
        _moreCheckArray = [NSMutableArray array];
    }
    return _moreCheckArray;
}

-(NSMutableArray *)monthDataArray {
    if (!_monthDataArray) {
        _monthDataArray = [NSMutableArray array];
    }
    return _monthDataArray;
}

#pragma mark - 解析 HomePage 数据
-(void)requestHomePageDataWithUrl:(NSString *)url didFinished:(void (^)())finished {
    
    [BC_NetTools sessionDataWithUrl:url HttpMethod:@"get" HttpBody:nil revokeBlock:^(NSData *data) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if (!dict) {
            return ;
        }
        NSDictionary *dataDict = dict[@"data"];
        
        NSArray *listArray = dataDict[@"list"];
        
        for (NSDictionary *dict in listArray) {
            
            Model *m = [[Model alloc] init];
            [m setValuesForKeysWithDictionary:dict];
            [self.modelArray addObject:m];
        }
        
        NSDictionary *mainDict = listArray[0];
        
        NSArray *dataArray1 = mainDict[@"data"];
        
        for (NSDictionary *dict in dataArray1) {
            
            WLLGuidanceModel *model = [[WLLGuidanceModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [self.guidanceArray addObject:model];
        }
        

        NSDictionary *eliteDict = listArray[1];
        WLLTodayNotesModel *model = [[WLLTodayNotesModel alloc] init];
        
        NSDictionary *Dict = eliteDict[@"data"];
        model.title = Dict[@"title"];
        model.sub_title_text = Dict[@"sub_title_text"];
        
        NSDictionary *noteDict = Dict[@"note"];
        model.note_title = noteDict[@"title"];
        model.thumbnail = noteDict[@"thumbnail"];
        model.jump_url = noteDict[@"jump_url"];
        
        NSDictionary *userDict = noteDict[@"user"];
        model.user_name = userDict[@"name"];
        model.logo = userDict[@"logo"];
        
        NSArray *mddsArray = noteDict[@"mdds"];
        
        for (NSDictionary *dict in mddsArray) {

            [model setValuesForKeysWithDictionary:dict];
        }
        [self.todayNotesArray addObject:model];
        
        
        NSDictionary *salesDict = listArray[2];
        
        NSDictionary *dataSDict = salesDict[@"data"];
        
        NSArray *listSArray = dataSDict[@"list"];
        
        for (NSDictionary *dict in listSArray) {
            
            WLLDestinationModel *model = [[WLLDestinationModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [self.destinationArray addObject:model];
        }
        
        NSDictionary *commonDict = listArray[3];
        
        NSDictionary *dataCDict = commonDict[@"data"];
        
        NSArray *commonArray = dataCDict[@"list"];
        
        
        for (NSDictionary *dict in commonArray) {
            WLLRecommendModel *model = [[WLLRecommendModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [self.recommendArray addObject:model];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            finished();
        });
    }];
}

-(NSInteger)countOfguidanceArray {
    return self.guidanceArray.count;
}

-(WLLGuidanceModel *)guidanceModelWithIdex:(NSInteger)index {
    
    WLLGuidanceModel *model = self.guidanceArray[index];
    return model;
}

-(NSInteger)countOfTadayNotesArray {
    return self.todayNotesArray.count;
}

-(WLLTodayNotesModel *)todayNotesModelWithIndex:(NSInteger)index {
    WLLTodayNotesModel *model = self.todayNotesArray[index];
    return model;
}

-(NSInteger)countOfDestinationArray {
    return self.destinationArray.count;
}

-(WLLDestinationModel *)destinationModelWithIndex:(NSInteger)index {
    WLLDestinationModel *model = self.destinationArray[index];
    return model;
}

-(NSInteger)countOfRecommendArray {
    return self.recommendArray.count;
}

-(WLLRecommendModel *)recommendModelWithIndex:(NSInteger)index {
    WLLRecommendModel *model = self.recommendArray[index];
    return model;
}

-(NSInteger)countOfModelArray {
    
    return self.modelArray.count;
}


#pragma mark - 解析热门目的地

-(void)requestPopDestinationDataWithUrl:(NSString *)url didFinished:(void (^)())finished {
    
    [self.popDestArray removeAllObjects];
    
    NSData *data = [NSData dataWithContentsOfFile:url];
   
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    if (!dict) {
        return;
    }
    
    // 热门目的地
    NSDictionary *dataDict = dict[@"data"];
    NSArray *dataArray = dataDict[@"data"];
   
    for (NSDictionary *dict in dataArray) {
        WLLPopModel *model = [[WLLPopModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [self.popDestArray addObject:model];
    }
    
    
    // 目的地推荐
    [self.monthDataArray removeAllObjects];
    NSDictionary *Ddict = dict[@"data"];
    NSArray *listArray = Ddict[@"list"];
    NSDictionary *listDict = [listArray firstObject];
    NSArray *itemsArray = listDict[@"items"];
    for (NSDictionary *dict in itemsArray) {
        WLLBoracayIslandModel *model = [[WLLBoracayIslandModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [self.monthDataArray addObject:model];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
            finished();
        });
}

-(NSInteger)countOfPopDestinationArray {
    return self.popDestArray.count;
}

-(WLLPopModel *)popModelWithIndex:(NSInteger)index {
    WLLPopModel *model = self.popDestArray[index];
    return model;
}

-(NSInteger)countOfMonthDataArray {
    return self.monthDataArray.count;
}

-(WLLBoracayIslandModel *)monthModelWithIndex:(NSInteger)index {
    WLLBoracayIslandModel *model = self.monthDataArray[index];
    return model;
}


#pragma mark - 解析查看更多

-(void)requestMoreOverDataWithUrl:(NSString *)url finished:(void (^)())finished {
    
    [self.moreOverArray removeAllObjects];
    [BC_NetTools solveDataWithUrl:url httpMethod:@"get" httpBody:nil revokeBlock:^(NSData *data) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if (!dict) {
            return ;
        }
        NSDictionary *dataDict = dict[@"data"];
        
        NSArray *listArray = dataDict[@"list"];
        for (NSDictionary *dict in listArray) {
            WLLMoreOverModel *model = [[WLLMoreOverModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [self.moreOverArray addObject:model];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            finished();
        });
    }];
}

-(NSInteger)countOfMoreOverArray {
    return self.moreOverArray.count;
}

-(WLLMoreOverModel *)moreOverModelWithIndex:(NSInteger)index {
    WLLMoreOverModel *model = self.moreOverArray[index];
    return model;
}


-(void)requestMoreCheckDataWithUrl:(NSString *)url finished:(void (^)())finished {
    
    [self.moreCheckArray removeAllObjects];
    [BC_NetTools sessionDataWithUrl:url HttpMethod:@"get" HttpBody:nil revokeBlock:^(NSData *data) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if (!dict) {
            return ;
        }
        NSDictionary *dataDict = dict[@"data"];
        
        NSArray *listArr = dataDict[@"list"];
        for (NSDictionary *dict in listArr) {
            WLLMoreCheckModel *model = [[WLLMoreCheckModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [self.moreCheckArray addObject:model];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            finished();
        });
        
    }];
}

-(NSInteger)countOfMoreCheckArray {
    return self.moreCheckArray.count;
}

-(WLLMoreCheckModel *)moreCheckModelWithIdex:(NSInteger)index {
    WLLMoreCheckModel *model = self.moreCheckArray[index];
    return model;
}

@end
