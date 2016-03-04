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

@interface WLLHomePageDataManager ()

@property (nonatomic, strong) NSMutableArray *guidanceArray;
@property (nonatomic, strong) NSMutableArray *todayNotesArray;
@property (nonatomic, strong) NSMutableArray *destinationArray;
@property (nonatomic, strong) NSMutableArray *recommendArray;

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

#pragma mark - 数组懒加载

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

#pragma mark - 解析 HomePage 数据
-(void)requestHomePageDataWithUrl:(NSString *)url didFinished:(void (^)())finished {
    
    [BC_NetTools sessionDataWithUrl:url HttpMethod:@"get" HttpBody:nil revokeBlock:^(NSData *data) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if (!dict) {
            return ;
        }
        NSDictionary *dataDict = dict[@"data"];
        
        NSArray *listArray = dataDict[@"list"];
        
        NSDictionary *mainDict = listArray[0];
        
        NSArray *dataArray1 = mainDict[@"data"];
        
        for (NSDictionary *dict in dataArray1) {
            
            WLLGuidanceModel *model = [[WLLGuidanceModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [self.guidanceArray addObject:model];
        }
        
        NSDictionary *eliteDict = listArray[1];
        
        NSDictionary *Dict = eliteDict[@"data"];
        
        NSDictionary *noteDict = Dict[@"note"];
        
        NSArray *mddsArray = noteDict[@"mdds"];
        
        for (NSDictionary *dict in mddsArray) {
            
            WLLTodayNotesModel *model = [[WLLTodayNotesModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [self.todayNotesArray addObject:model];
            
        }
        
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




@end
