//
//  DestinationManager.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "DestinationManager.h"
static DestinationManager *manager;

@implementation DestinationManager

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [DestinationManager new];
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.infoModel = [[InfoModel alloc] init];
    }
    
    return self;
}

- (NSMutableArray *)dataFunc {
    if (!_dataFunc) {
        _dataFunc = [NSMutableArray array];
    }
    return _dataFunc;
    
}

- (NSMutableArray *)dataTravel {
    if (!_dataTravel) {
        _dataTravel = [NSMutableArray array];
    }
    return _dataTravel;
}

-  (NSMutableArray *)dataSale {
    if (!_dataSale) {
        _dataSale = [NSMutableArray array];
    }
    return _dataSale;
}

- (NSMutableArray *)dataGo {
    if (!_dataGo) {
        _dataGo = [NSMutableArray array];
        
    }
    return _dataGo;
}

- (NSMutableArray *)dataLive {
    if (!_dataLive) {
        _dataLive = [NSMutableArray array];
        
    }
    return _dataLive;
}

- (NSMutableArray *)dataCate {
    if (!_dataCate) {
        _dataCate = [NSMutableArray array];
    }
    return _dataCate;
}

- (NSMutableArray *)dataPZone {
    if (!_dataPZone) {
        _dataPZone = [NSMutableArray array];
    }
    return _dataPZone;
}

- (NSMutableArray *)dataMore {
    if (!_dataMore) {
        _dataMore = [NSMutableArray array];
        
    }
    return _dataMore;
}

- (NSMutableArray *)dataCheckMore {
    if (!_dataCheckMore) {
        _dataCheckMore = [NSMutableArray array];
    }
    return _dataCheckMore;
}


- (void)loadDestinationData:(void (^)())finished url:(NSString *)url {
    [LH_NetTools SessionDataWithUrl:url httpMethod:@"GET" httpBody:nil revokeBlock:^(NSData *data) {
        
        [self removeData];
        
        NSDictionary *rDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *aDic = rDic[@"data"];
       
        NSArray *funcArr = aDic[@"icons"];
        for (NSDictionary *dic in funcArr) {
            FuncModel *m = [[FuncModel alloc] init];
            [m setValuesForKeysWithDictionary:dic];
            [self.dataFunc addObject:m];
        }
        
        
        NSDictionary *mddDic = aDic[@"mdd"];
        [self.infoModel setValuesForKeysWithDictionary:mddDic];
        
        
        
        NSInteger n = 0;
        NSArray *listArr = aDic[@"list"];
        n = listArr.count - 7;
        NSDictionary *dic1 = (NSDictionary *)(listArr[0 + n])[@"data"];
        CheckMoreModel *cmm1 = [[CheckMoreModel alloc] init];
        [cmm1 setValuesForKeysWithDictionary:dic1];
        [self.dataCheckMore addObject:cmm1];
        
        NSArray *travelArr = dic1[@"list"];
        for (NSDictionary *dic in travelArr) {
            TravelModel *m = [[TravelModel alloc] init];
            [m setValuesForKeysWithDictionary:dic];
            [self.dataTravel addObject:m];
        }
        
        NSDictionary *dic2 = (NSDictionary *)(listArr[1 + n])[@"data"];
        CheckMoreModel *cmm2 = [[CheckMoreModel alloc] init];
        [cmm2 setValuesForKeysWithDictionary:dic2];
        [self.dataCheckMore addObject:cmm2];
        
        NSArray *saleArr = dic2[@"list"];
        for (NSDictionary *dic in saleArr) {
            SaleModel *m = [[SaleModel alloc] init];
            [m setValuesForKeysWithDictionary:dic];
            [self.dataSale addObject:m];
        }
        
        NSDictionary *dic3 = (NSDictionary *)(listArr[2 + n])[@"data"];
        CheckMoreModel *cmm3 = [[CheckMoreModel alloc] init];
        [cmm3 setValuesForKeysWithDictionary:dic3];
        [self.dataCheckMore addObject:cmm3];
        
        NSArray *goArr = dic3[@"list"];
        for (NSDictionary *dic in goArr) {
            GoModel *m =[[GoModel alloc] init];
            [m setValuesForKeysWithDictionary:dic];
            [self.dataGo addObject:m];
        }
        
        
        NSDictionary *dic4 = (NSDictionary *)(listArr[3 + n])[@"data"];
        NSArray *liveArr = dic4[@"list"];
        for (NSDictionary *dic in liveArr) {
            LiveModel *m = [[LiveModel alloc] init];
            [m setValuesForKeysWithDictionary:dic];
            [self.dataLive addObject:m];
        }
        
        
        NSDictionary *dic5 = (NSDictionary *)(listArr[4 + n])[@"data"];
        CheckMoreModel *cmm4 = [[CheckMoreModel alloc] init];
        [cmm4 setValuesForKeysWithDictionary:dic5];
        [self.dataCheckMore addObject:cmm4];
        
        NSArray *cateArr = dic5[@"list"];
        for (NSDictionary *dic in cateArr) {
            CateModel *m = [[CateModel alloc] init];
            [m setValuesForKeysWithDictionary:dic];
            [self.dataCate addObject:m];
            
        }
        
        
        NSDictionary *dic6 = (NSDictionary *)(listArr[5 + n])[@"data"];
        NSArray *pZoneArr = dic6[@"list"];
        for (NSDictionary *dic in pZoneArr) {
            PZoneModel *m = [[PZoneModel alloc] init];
            [m setValuesForKeysWithDictionary:dic];
            [self.dataPZone addObject:m];
            
        }
        
        NSDictionary *dic7 = (NSDictionary *)(listArr[6 + n])[@"data"];
        CheckMoreModel *cmm5 = [[CheckMoreModel alloc] init];
        [cmm5 setValuesForKeysWithDictionary:dic7];
        [self.dataCheckMore addObject:cmm5];
        
        NSArray *moreArr = dic7[@"list"];
        for (NSDictionary *dic in moreArr) {
            MoreModel *m = [[MoreModel alloc] init];
            [m setValuesForKeysWithDictionary:dic];
            [self.dataMore addObject:m];
        }
        
        
       dispatch_async(dispatch_get_main_queue(), ^{
           
           finished();
           
       });
        
        
        
        
        
    }];
    
}


- (void)removeData {
    [self.dataFunc removeAllObjects];
    [self.dataCheckMore removeAllObjects];
    [self.dataGo removeAllObjects];
    [self.dataLive removeAllObjects];
    [self.dataMore removeAllObjects];
    [self.dataPZone removeAllObjects];
    [self.dataSale removeAllObjects];
    [self.dataTravel removeAllObjects];
    [self.dataCate removeAllObjects];
    
}


- (NSMutableArray *)dataHot {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dataHot = [NSMutableArray array];
        HotModel *m1 = [[HotModel alloc] init];
        m1.name = @"香港";
        m1.jump_url = DestinationUrlXiangGang;
        [_dataHot addObject:m1];
        
        HotModel *m2 = [[HotModel alloc] init];
        m2.name = @"成都";
        m2.jump_url = DestinationUrlChengDu;
        [_dataHot addObject:m2];
        
        HotModel *m3 = [[HotModel alloc] init];
        m3.name = @"丽江";
        m3.jump_url = DestinationUrlLiJiang;
        [_dataHot addObject:m3];
        
        HotModel *m4 = [[HotModel alloc] init];
        m4.name = @"北京";
        m4.jump_url = DestinationUrlBeiJing;
        [_dataHot addObject:m4];
        
        HotModel *m5 = [[HotModel alloc] init];
        m5.name = @"九寨沟";
        m5.jump_url = DestinationUrlJiuZhai;
        [_dataHot addObject:m5];
        
        HotModel *m6 = [[HotModel alloc] init];
        m6.name = @"三亚";
        m6.jump_url = DestinationUrlSanYa;
        [_dataHot addObject:m6];
        
        HotModel *m7 = [[HotModel alloc] init];
        m7.name = @"西安";
        m7.jump_url = DestinationUrlXiAn;
        [_dataHot addObject:m7];
        
        HotModel *m8 = [[HotModel alloc] init];
        m8.name = @"重庆";
        m8.jump_url = DestinationUrlChongQing;
        [_dataHot addObject:m8];
        
        HotModel *m9 = [[HotModel alloc] init];
        m9.name = @"曼谷";
        m9.jump_url = DestinationUrlBangkok;
        [_dataHot addObject:m9];
        
        HotModel *m10 = [[HotModel alloc] init];
        m10.name = @"巴厘岛";
        m10.jump_url = DestinationUrlBali;
        [_dataHot addObject:m10];
        
        HotModel *m11 = [[HotModel alloc] init];
        m11.name = @"新加坡";
        m11.jump_url = DestinationUrlSingapore;
        [_dataHot addObject:m11];
        
        HotModel *m12 = [[HotModel alloc] init];
        m12.name = @"首尔";
        m12.jump_url = DestinationUrlSeoul;
        [_dataHot addObject:m12];
        
        HotModel *m13 = [[HotModel alloc] init];
        m13.name = @"伦敦";
        m13.jump_url = DestinationUrlLondon;
        [_dataHot addObject:m13];
        
        HotModel *m14 = [[HotModel alloc] init];
        m14.name = @"巴黎";
        m14.jump_url = DestinationUrlParis;
        [_dataHot addObject:m14];
        
        HotModel *m15 = [[HotModel alloc] init];
        m15.name = @"北海道";
        m15.jump_url = DestinationUrlKokkaido;
        [_dataHot addObject:m15];
        
        HotModel *m16 = [[HotModel alloc] init];
        m16.name = @"你猜";
        [_dataHot addObject:m16];
        
        
    });
    
    return _dataHot;

}

- (NSMutableArray *)dataImage {
    if (!_dataImage) {
        _dataImage = [NSMutableArray array];
    }
    
    return _dataImage;
}


- (void)loadImageData:(void (^)())finished {
    NSString *originStr = [NSString stringWithFormat:@"http://image.baidu.com/search/wisejsonala?tn=wisejsonala&ie=utf8&word=%@%@&fr=&pn=120&rn=30&gsm=78", self.infoModel.name, @"风景"];
    NSString *encodeStr = [originStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [LH_NetTools SessionDataWithUrl:encodeStr httpMethod:@"GET" httpBody:nil revokeBlock:^(NSData *data) {
        NSDictionary *rdic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *arr = rdic[@"data"];
        [self.dataImage removeAllObjects];
        for (NSDictionary *dic in arr) {
            ImgeModel *m = [[ImgeModel alloc] init];
            [m setValuesForKeysWithDictionary:dic];
            [self.dataImage addObject:m];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            finished();
            
            
        });
        
        
        
    }];
    
}

- (NSMutableArray *)dataAllSights {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dataAllSights = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"JDData" ofType:@"txt"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        for (NSDictionary *dic in arr) {
            SightModel *m = [[SightModel alloc] init];
            [m setValuesForKeysWithDictionary:dic];
            [_dataAllSights addObject:m];
            
        }
        
    });
    

    return _dataAllSights;
}

- (NSMutableArray *)dataSearchList {
    if (!_dataSearchList) {
        _dataSearchList = [NSMutableArray array];
    }
    return _dataSearchList;
}


- (void)filterSearchListWithText:(NSString *)searchText {
    [self.dataSearchList removeAllObjects];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@", searchText];
    self.dataSearchList = [self.dataAllSights filteredArrayUsingPredicate:predicate].mutableCopy;

}




@end
