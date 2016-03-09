//
//  DestinationManager.h
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InfoModel.h"
#import "FuncModel.h"
#import "TravelModel.h"
#import "SaleModel.h"
#import "GoModel.h"
#import "LiveModel.h"
#import "CateModel.h"
#import "PZoneModel.h"
#import "MoreModel.h"
#import "CheckMoreModel.h"
#import "LH_NetTools.h"
#import "DestinationHeader.h"
#import "HotModel.h"
#import "ImgeModel.h"
#import "SightModel.h"
@interface DestinationManager : NSObject

@property (nonatomic, strong) InfoModel *infoModel;
@property (nonatomic, strong) NSMutableArray *dataFunc;
@property (nonatomic, strong) NSMutableArray *dataTravel;
@property (nonatomic, strong) NSMutableArray *dataSale;
@property (nonatomic, strong) NSMutableArray *dataGo;
@property (nonatomic, strong) NSMutableArray *dataLive;
@property (nonatomic, strong) NSMutableArray *dataCate;
@property (nonatomic, strong) NSMutableArray *dataPZone;
@property (nonatomic, strong) NSMutableArray *dataMore;
@property (nonatomic, strong) NSMutableArray *dataCheckMore;
@property (nonatomic, strong) NSMutableArray *dataHot;
@property (nonatomic, strong) NSMutableArray *dataImage;
@property (nonatomic, strong) NSMutableArray *dataAllSights;
@property (nonatomic, strong) NSMutableArray *dataSearchList;


+ (instancetype)shareInstance;

- (void)loadDestinationData:(void (^)())finished url:(NSString *)url;

- (void)loadImageData:(void (^)())finished;

- (void)filterSearchListWithText:(NSString *)searchText;



@end
