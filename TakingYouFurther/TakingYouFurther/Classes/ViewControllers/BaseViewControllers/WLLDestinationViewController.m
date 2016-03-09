//
//  WLLDestinationViewController.m
//  TakingYouFurther
//
//  Created by lanou3g on 16/2/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "WLLDestinationViewController.h"
#import <MapKit/MapKit.h>
#import "DestinationManager.h"
#import "InfoTableViewCell.h"
#import "ImgTableViewCell.h"
#import "FuncCollectionViewCell.h"
#import "TravelTableViewCell.h"
#import "SalesTableViewCell.h"
#import "GoTableViewCell.h"
#import "CheckMoreTableViewCell.h"
#import "LiveCollectionViewCell.h"
#import "CateTableViewCell.h"
#import "PZoneCollectionViewCell.h"
#import "MoreTableViewCell.h"
#import "DestinationHeader.h"
#import "UIImageView+WebCache.h"
#import "SearchTableViewController.h"
#import "DestinationDetailViewController.h"
#import "DestinationImageCollectionViewController.h"
#import "ListSearchTableViewController.h"
@interface WLLDestinationViewController ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *mddImgView;
@property (weak, nonatomic) IBOutlet UITableView *mddTable;
@property (weak, nonatomic) IBOutlet UICollectionView *funcCollection;
@property (weak, nonatomic) IBOutlet UIPageControl *funcPage;
@property (weak, nonatomic) IBOutlet UITableView *travelTable;
@property (weak, nonatomic) IBOutlet UITableView *saleTable;
@property (weak, nonatomic) IBOutlet UITableView *goTable;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UICollectionView *liveCollection;
@property (weak, nonatomic) IBOutlet UITableView *cateTable;
@property (weak, nonatomic) IBOutlet UICollectionView *pZoneCollection;
@property (weak, nonatomic) IBOutlet UITableView *moreTable;
@property (nonatomic, assign) BOOL isFinishedLoad;
@property (weak, nonatomic) IBOutlet UIScrollView *superScroll;
@property (nonatomic, strong) SearchTableViewController *searchVC;
@property (nonatomic, assign) BOOL isSearchEditting;
@property (nonatomic, assign) BOOL isJumped;
@property (nonatomic, strong) ListSearchTableViewController *listSearchVC;
@property (nonatomic, strong) UIRefreshControl *refresh;
@end

@implementation WLLDestinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBarHidden = YES;
    
    self.mddUrl = DestinationUrlSanYa;
    
    [self.funcPage addTarget:self action:@selector(funcPageAction:) forControlEvents:UIControlEventValueChanged];
    
    [self setDelegate];
    
    [self setTag];
    
    [self registerCell];
    
    [self collectionLayout];
    
    [self loadData:self.mddUrl];
    
    [self makeSearchBar];
    
    [self setupRefreshControl];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)setupRefreshControl {
    
    UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -120, SWidth, 95)];
    topView.image = [UIImage imageNamed:@"top"];
    [self.superScroll addSubview:topView];

    self.refresh = [[UIRefreshControl alloc] init];
    self.refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"拉一下世界更清新"];
    [self.refresh addTarget:self action:@selector(refreshAction:) forControlEvents:UIControlEventValueChanged];
    self.refresh.tintColor = [UIColor whiteColor];
    [self.superScroll addSubview:self.refresh];
    
    
}

- (void)refreshAction:(UIRefreshControl *)sender {
    sender.attributedTitle = [[NSAttributedString alloc] initWithString:@"请稍等,马上呈现美丽新世界..."];
    [self performSelector:@selector(refreshData) withObject:nil afterDelay:3];
    
}

- (void)refreshData {
    [self loadData:self.mddUrl];
    [self.refresh endRefreshing];
    
}



- (void)makeSearchBar {
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 20, SWidth - 40 - 20 - 30, 40)];
    self.searchBar.delegate = self;
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchBar.placeholder = @"老板想去哪儿?我拿牛车拉你...";
    UITextField *searchField = [self.searchBar valueForKey:@"searchField"];
    searchField.highlighted = YES;
    searchField.textColor = [UIColor whiteColor];
    [searchField setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
    [searchField setValue:@(YES) forKeyPath:@"placeholderLabel.highlighted"];
    
    [self.view addSubview:self.searchBar];
    
    self.searchVC = [[SearchTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self addChildViewController:self.searchVC];
    self.searchVC.view.frame = CGRectMake(0, 64, SWidth, 0);
    [self.view addSubview:self.searchVC.view];
    
    self.listSearchVC = [[ListSearchTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self addChildViewController:self.listSearchVC];
    self.listSearchVC.view.frame = CGRectMake(0, 64, SWidth, 0);
    [self.view addSubview:self.listSearchVC.view];
    

    
}

- (void)setSearchVCHidden:(BOOL)hidden {
    if (hidden) {
        self.searchVC.view.frame = CGRectMake(0, 64, SWidth, 0);
        self.searchBar.showsCancelButton = NO;
        self.searchBar.text = nil;
        
        if (self.superScroll.contentOffset.y < (0.45 * SHeight - 20)) {
            self.searchBar.frame = CGRectMake(20, 20, SWidth - 40 - 20 - 30, 40);
            self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
            UITextField *searchField = [self.searchBar valueForKey:@"searchField"];
            [searchField setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
            searchField.textColor = [UIColor whiteColor];
            
            [self.view addSubview:self.searchBar];
            self.navigationController.navigationBarHidden = YES;
            
        }
        
        
        
        [self.searchBar endEditing:YES];
        
        self.isSearchEditting = NO;

        
        
    } else {
        self.searchVC.view.frame = CGRectMake(0, 64, SWidth, SHeight - 64);
        self.isSearchEditting = YES;
        
        self.searchBar.showsCancelButton = YES;
        for (id cc in self.searchBar.subviews) {
            if ([cc isKindOfClass:[UIButton class]]) {
                [cc setTitle:@"取消" forState:UIControlStateNormal];
                
            }
        }
        
        
        if (self.superScroll.contentOffset.y < (0.45 * SHeight - 20)) {
            self.searchBar.frame = CGRectMake(20, 0, SWidth - 40 - 20 - 30, 40);
            self.searchBar.searchBarStyle = UISearchBarStyleDefault;
            UITextField *searchField = [self.searchBar valueForKey:@"searchField"];
            [searchField setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
            searchField.textColor = [UIColor blackColor];
            
            [self.navigationController.navigationBar addSubview:self.searchBar];
            self.navigationController.navigationBarHidden = NO;
            
        }

    }
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    [self setSearchVCHidden:NO];

    return YES;
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    self.listSearchVC.view.frame = CGRectMake(0, 64, SWidth, 0);
    [self setSearchVCHidden:YES];
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length == 0) {
        self.listSearchVC.view.frame = CGRectMake(0, 64, SWidth, 0);
        return;
    }
    
    [[DestinationManager shareInstance] filterSearchListWithText:searchText];
    [self.listSearchVC.tableView reloadData];
    self.listSearchVC.view.frame = CGRectMake(0, 64, SWidth, SHeight - 64);
    
}





- (void)collectionLayout {
    UICollectionViewFlowLayout *funcLayout = [[UICollectionViewFlowLayout alloc] init];
    funcLayout.itemSize = CGSizeMake(SWidth / 4.0, 0.225 * SHeight - 20);
    funcLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    funcLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    funcLayout.minimumInteritemSpacing = 0;
    funcLayout.minimumLineSpacing = 0;
    self.funcCollection.collectionViewLayout = funcLayout;
    
    UICollectionViewFlowLayout *liveLayout = [[UICollectionViewFlowLayout alloc] init];
    liveLayout.itemSize = CGSizeMake(SWidth - (80 / 3.0), 0.24 * SHeight - 90);
    liveLayout.sectionInset = UIEdgeInsetsMake(10, 30, 10, 30);
    liveLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    liveLayout.minimumLineSpacing = 10;
    liveLayout.minimumInteritemSpacing = 10;
    self.liveCollection.collectionViewLayout = liveLayout;
    
    UICollectionViewFlowLayout *pZoneLayout = [[UICollectionViewFlowLayout alloc] init];
    pZoneLayout.itemSize = CGSizeMake((SWidth - 70) / 3.0, 0.35 * SHeight - 65);
    pZoneLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    pZoneLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    pZoneLayout.minimumLineSpacing = 10;
    pZoneLayout.minimumInteritemSpacing = 10;
    self.pZoneCollection.collectionViewLayout = pZoneLayout;
    
    
}


- (void)loadData:(NSString *)url {
    
    [[DestinationManager shareInstance] loadDestinationData:^{
        
        self.isFinishedLoad = YES;
        InfoModel *m = [DestinationManager shareInstance].infoModel;
        [self.mddImgView sd_setImageWithURL:[NSURL URLWithString:m.header_img] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            CIContext *ctt = [CIContext contextWithOptions:nil];
            CIImage *inputImg = [CIImage imageWithCGImage:image.CGImage];
            CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
            [filter setValue:inputImg forKey:kCIInputImageKey];
            [filter setValue:@(10) forKey:@"inputRadius"];
            CIImage *outImg = [filter valueForKey:kCIOutputImageKey];
            CGImageRef cgImg = [ctt createCGImage:outImg fromRect:[inputImg extent]];
            UIImage *blurImg = [UIImage imageWithCGImage:cgImg];
            
            self.mddImgView.image = blurImg;
            
            
        }];
        
        MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
        MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(((LiveModel *)[DestinationManager shareInstance].dataLive[0]).lat, ((LiveModel *)[DestinationManager shareInstance].dataLive[0]).lng), span);
        [self.mapView setRegion:region animated:YES];
        
        [self.mddTable reloadData];
        [self.travelTable reloadData];
        [self.saleTable reloadData];
        [self.goTable reloadData];
        [self.cateTable reloadData];
        [self.moreTable reloadData];
        [self.funcCollection reloadData];
        [self.liveCollection reloadData];
        [self.pZoneCollection reloadData];

    } url:url];
    
        
 
    
}




- (void)registerCell {
    
    [self.mddTable registerNib:[UINib nibWithNibName:@"InfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"info"];
    [self.mddTable registerNib:[UINib nibWithNibName:@"ImgTableViewCell" bundle:nil] forCellReuseIdentifier:@"img"];
    
    [self.travelTable registerNib:[UINib nibWithNibName:@"TravelTableViewCell" bundle:nil] forCellReuseIdentifier:@"travel"];
    [self.travelTable registerNib:[UINib nibWithNibName:@"CheckMoreTableViewCell" bundle:nil] forCellReuseIdentifier:@"checkMore"];
    
    [self.saleTable registerNib:[UINib nibWithNibName:@"SalesTableViewCell" bundle:nil] forCellReuseIdentifier:@"sales"];
    [self.saleTable registerNib:[UINib nibWithNibName:@"CheckMoreTableViewCell" bundle:nil] forCellReuseIdentifier:@"checkMore"];
    
    [self.goTable registerNib:[UINib nibWithNibName:@"GoTableViewCell" bundle:nil] forCellReuseIdentifier:@"go"];
    [self.goTable registerNib:[UINib nibWithNibName:@"CheckMoreTableViewCell" bundle:nil] forCellReuseIdentifier:@"checkMore"];
    
    [self.cateTable registerNib:[UINib nibWithNibName:@"CateTableViewCell" bundle:nil] forCellReuseIdentifier:@"cate"];
    [self.cateTable registerNib:[UINib nibWithNibName:@"CheckMoreTableViewCell" bundle:nil] forCellReuseIdentifier:@"checkMore"];
    
    [self.moreTable registerNib:[UINib nibWithNibName:@"MoreTableViewCell" bundle:nil] forCellReuseIdentifier:@"more"];
    [self.moreTable registerNib:[UINib nibWithNibName:@"CheckMoreTableViewCell" bundle:nil] forCellReuseIdentifier:@"checkMore"];
    
    [self.funcCollection registerClass:[FuncCollectionViewCell class] forCellWithReuseIdentifier:@"func"];
    [self.funcCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"empty"];
    
    [self.liveCollection registerNib:[UINib nibWithNibName:@"LiveCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"live"];
    
    [self.pZoneCollection registerNib:[UINib nibWithNibName:@"PZoneCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"pZone"];
    
    
}

- (void)setTag {
    
    self.superScroll.tag = 100;
    
    self.mddTable.tag = 101;
    self.travelTable.tag = 102;
    self.saleTable.tag = 103;
    self.goTable.tag = 104;
    self.cateTable.tag = 105;
    self.moreTable.tag = 106;
    
    self.funcCollection.tag = 111;
    self.liveCollection.tag = 112;
    self.pZoneCollection.tag = 113;
    
    
}


- (void)setDelegate {
    
    self.superScroll.delegate = self;
    
    self.mddTable.dataSource = self;
    self.mddTable.delegate = self;
    
    self.funcCollection.dataSource = self;
    self.funcCollection.delegate = self;
    
    self.travelTable.dataSource = self;
    self.travelTable.delegate = self;
    
    self.saleTable.dataSource = self;
    self.saleTable.delegate = self;
    
    self.goTable.dataSource = self;
    self.goTable.delegate = self;
    
    self.liveCollection.dataSource = self;
    self.liveCollection.delegate = self;
    
    self.cateTable.dataSource = self;
    self.cateTable.delegate = self;
    
    self.pZoneCollection.dataSource = self;
    self.pZoneCollection.delegate = self;
    
    self.moreTable.dataSource = self;
    self.moreTable.delegate = self;
    
}

- (void)funcPageAction:(UIPageControl *)sender {
    self.funcCollection.contentOffset = CGPointMake(sender.currentPage * SWidth, 0);
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag == 111) {
        self.funcPage.currentPage = scrollView.contentOffset.x / SWidth;
    }
    
    if (scrollView.tag == 112) {
        LiveModel *m = [DestinationManager shareInstance].dataLive[(NSInteger)(scrollView.contentOffset.x / SWidth)];
        MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
        MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(m.lat, m.lng), span);
        [self.mapView setRegion:region animated:YES];
    }
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag == 100) {
        if (scrollView.contentOffset.y >= (0.45 * SHeight - 20)) {
            if (self.isJumped) {
                return;
            }
            self.searchBar.frame = CGRectMake(20, 0, SWidth - 40 - 20 - 30, 40);
            self.searchBar.searchBarStyle = UISearchBarStyleDefault;
            UITextField *searchField = [self.searchBar valueForKey:@"searchField"];
            [searchField setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
            searchField.textColor = [UIColor blackColor];
            
            [self.navigationController.navigationBar addSubview:self.searchBar];
            self.navigationController.navigationBarHidden = NO;
            
        } else {
            if (!self.isSearchEditting && !self.isJumped) {
                self.searchBar.frame = CGRectMake(20, 20, SWidth - 40 - 20 - 30, 40);
                self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
                UITextField *searchField = [self.searchBar valueForKey:@"searchField"];
                [searchField setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
                searchField.textColor = [UIColor whiteColor];
                
                [self.view addSubview:self.searchBar];
                self.navigationController.navigationBarHidden = YES;
            }
            
        }
        
        
    }
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count = 0;
    switch (collectionView.tag) {
        case 111:
            count = 16;
            break;
        case 112:
            count = 3;
            break;
        case 113:
            count = [DestinationManager shareInstance].dataPZone.count;
            break;
        default:
            break;
    }
    
    if (!self.isFinishedLoad) {
        count = 0;
    }
    
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (collectionView.tag) {
        case 111: {
            FuncCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"func" forIndexPath:indexPath];
            FuncModel *m;
            switch (indexPath.row) {
                case 0:
                    m = [DestinationManager shareInstance].dataFunc[0];
                    break;
                case 1:
                    m = [DestinationManager shareInstance].dataFunc[4];
                    break;
                case 2:
                    m = [DestinationManager shareInstance].dataFunc[1];
                    break;
                case 3:
                    m = [DestinationManager shareInstance].dataFunc[5];
                    break;
                case 4:
                    m = [DestinationManager shareInstance].dataFunc[2];
                    break;
                case 5:
                    m = [DestinationManager shareInstance].dataFunc[6];
                    break;
                case 6:
                    m = [DestinationManager shareInstance].dataFunc[3];
                    break;
                case 7:
                    m = [DestinationManager shareInstance].dataFunc[7];
                    break;
                case 8:
                    m = [DestinationManager shareInstance].dataFunc[8];
                    break;
                case 10:
                    m = [DestinationManager shareInstance].dataFunc[9];
                    break;
                default: {
                    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"empty" forIndexPath:indexPath];
                    return cell;
                    break;
                }
                    
            }
            
            cell.model = m;
            
            return cell;
             break;
        }
            
        case 112: {
            LiveCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"live" forIndexPath:indexPath];
            LiveModel *m = [DestinationManager shareInstance].dataLive[indexPath.row];
            cell.model = m;
            cell.labelRand.text = [NSString stringWithFormat:@"%ld", (indexPath.row + 1)];
            
            return cell;
             break;
        }
            
        case 113: {
            PZoneCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pZone" forIndexPath:indexPath];
            PZoneModel *m = [DestinationManager shareInstance].dataPZone[indexPath.row];
            cell.model = m;
            
            return cell;
             break;
        }
            
        default:
            break;
    }
    
    return nil;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (collectionView.tag) {
        case 111: {
//            FuncModel *m;
            NSString *url;
            switch (indexPath.row) {
                case 0:
//                    m = [DestinationManager shareInstance].dataFunc[0];
                    url = [NSString stringWithFormat:@"http://m.mafengwo.cn/baike/%@/", [DestinationManager shareInstance].infoModel.did];
                    break;
                case 1:
//                    m = [DestinationManager shareInstance].dataFunc[4];
                    url = [NSString stringWithFormat:@"http://m.mafengwo.cn/mdd/%@", [DestinationManager shareInstance].infoModel.did];
                    break;
                case 2:
//                    m = [DestinationManager shareInstance].dataFunc[1];
                    url = [NSString stringWithFormat:@"http://m.mafengwo.cn/jd/%@/gonglve.html", [DestinationManager shareInstance].infoModel.did];
                    break;
                case 3:
//                    m = [DestinationManager shareInstance].dataFunc[5];
                    url = [NSString stringWithFormat:@"http://m.mafengwo.cn/wenda/area-%@.html", [DestinationManager shareInstance].infoModel.did];
                    break;
                case 4:
//                    m = [DestinationManager shareInstance].dataFunc[2];
                    url = [NSString stringWithFormat:@"http://m.mafengwo.cn/hotel/%@/", [DestinationManager shareInstance].infoModel.did];
                    break;
                case 5:
//                    m = [DestinationManager shareInstance].dataFunc[6];
                    url = @"http://m.mafengwo.cn/sales/#sales_list";
                    break;
                case 6:
//                    m = [DestinationManager shareInstance].dataFunc[3];
                    url = [NSString stringWithFormat:@"http://m.mafengwo.cn/cy/%@/gonglve.html", [DestinationManager shareInstance].infoModel.did];
                    break;
                case 7:
//                    m = [DestinationManager shareInstance].dataFunc[7];
                    url = [NSString stringWithFormat:@"http://m.mafengwo.cn/localdeals/%@/?cid=1010401", [DestinationManager shareInstance].infoModel.did];
                    break;
                case 8:
//                    m = [DestinationManager shareInstance].dataFunc[8];
                    url = [NSString stringWithFormat:@"http://m.mafengwo.cn/gw/%@/gonglve.html", [DestinationManager shareInstance].infoModel.did];
                    break;
                case 10:
//                    m = [DestinationManager shareInstance].dataFunc[9];
                    url = [NSString stringWithFormat:@"http://m.mafengwo.cn/yl/%@/gonglve.html", [DestinationManager shareInstance].infoModel.did];
                    break;
                default:
                    return;
                    break;
            }
            
            DestinationDetailViewController *ddvc = [[DestinationDetailViewController alloc] init];
            ddvc.jumpUrl = url;
            self.isJumped = YES;
            ddvc.jumpblock = ^ (BOOL jumpState) {
                self.isJumped = jumpState;
            };
            
            [self.navigationController pushViewController:ddvc animated:YES];
            
            break;
        }
            
        case 112: {
//            LiveModel *m = [DestinationManager shareInstance].dataLive[indexPath.row];
            DestinationDetailViewController *ddvc = [[DestinationDetailViewController alloc] init];
            ddvc.jumpUrl = [NSString stringWithFormat:@"http://m.mafengwo.cn/hotel/map_%@.html", [DestinationManager shareInstance].infoModel.did];
            self.isJumped = YES;
            ddvc.jumpblock = ^ (BOOL jumpState) {
                self.isJumped = jumpState;
            };

            [self.navigationController pushViewController:ddvc animated:YES];
            
            break;
        }
            
        case 113: {
            PZoneModel *m = [DestinationManager shareInstance].dataPZone[indexPath.row];
            DestinationDetailViewController *ddvc = [[DestinationDetailViewController alloc] init];
            NSArray *arr = [m.jump_url componentsSeparatedByString:@"="];
            NSString *str = arr[2];
            NSString *idStr = [str substringToIndex:5];
            ddvc.jumpUrl = [NSString stringWithFormat:@"http://m.mafengwo.cn/mdd/%@", idStr];
            self.isJumped = YES;
            ddvc.jumpblock = ^ (BOOL jumpState) {
                self.isJumped = jumpState;
            };

            [self.navigationController pushViewController:ddvc animated:YES];
            
            break;
        }
            
        default:
            break;
    }
    
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 0;
    switch (tableView.tag) {
        case 101:
            count = 2;
            break;
        case 102:
            count = 2;
            break;
        case 103:
            count = 4;
            break;
        case 104:
            count = 4;
            break;
        case 105:
            count = 2;
            break;
        case 106:
            count = [DestinationManager shareInstance].dataMore.count + 1;
            break;
        default:
            break;
    }
    
    if (!self.isFinishedLoad) {
        count = 0;
    }
    
    
    return count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (tableView.tag) {
        case 101: {
            if (indexPath.row == 0) {
                InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"info" forIndexPath:indexPath];
                InfoModel *m = [DestinationManager shareInstance].infoModel;
                cell.model = m;
                
                return cell;
            } else {
                ImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"img" forIndexPath:indexPath];
                InfoModel *m = [DestinationManager shareInstance].infoModel;
                cell.model = m;
                
                return cell;
                
            }
            
            break;
        }
            
        case 102: {
            if (indexPath.row == 0) {
                TravelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"travel" forIndexPath:indexPath];
                cell.modelArr = [DestinationManager shareInstance].dataTravel;
                
                return cell;
            } else {
                CheckMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"checkMore" forIndexPath:indexPath];
                CheckMoreModel *m = [DestinationManager shareInstance].dataCheckMore[0];
                cell.model = m;
                
                return cell;
            }
            
            break;
        }
            
        case 103: {
            if (indexPath.row == 3) {
                CheckMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"checkMore" forIndexPath:indexPath];
                CheckMoreModel *m = [DestinationManager shareInstance].dataCheckMore[1];
                cell.model = m;
                
                return cell;
            } else {
                SalesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sales" forIndexPath:indexPath];
                SaleModel *m = [DestinationManager shareInstance].dataSale[indexPath.row];
                cell.model = m;
                
                return cell;
            }
            
            break;
        }
            
           
        case 104: {
            if (indexPath.row == 3) {
                CheckMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"checkMore" forIndexPath:indexPath];
                CheckMoreModel *m = [DestinationManager shareInstance].dataCheckMore[2];
                cell.model = m;
                
                return cell;
            } else {
                GoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"go" forIndexPath:indexPath];
                GoModel *m = [DestinationManager shareInstance].dataGo[indexPath.row];
                cell.model = m;
                
                return cell;
            }
            
            break;
        }
            
           
        case 105: {
            if (indexPath.row == 0) {
                CateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cate" forIndexPath:indexPath];
                cell.modelArr = [DestinationManager shareInstance].dataCate;
                
                UITapGestureRecognizer *tapGesture1 =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cateTapAction:)];
                UITapGestureRecognizer *tapGesture2 =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cateTapAction:)];
                UITapGestureRecognizer *tapGesture3 =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cateTapAction:)];
                [cell.touchView1 addGestureRecognizer:tapGesture1];
                cell.touchView1.tag = 1;
                [cell.touchView2 addGestureRecognizer:tapGesture2];
                cell.touchView2.tag = 2;
                [cell.touchView3 addGestureRecognizer:tapGesture3];
                cell.touchView3.tag = 3;
                
                
                return cell;
            } else {
                CheckMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"checkMore" forIndexPath:indexPath];
                CheckMoreModel *m = [DestinationManager shareInstance].dataCheckMore[3];
                cell.model = m;
                
                return cell;
            }
            
            break;
        }
            
           
        case 106: {
            if (indexPath.row == [DestinationManager shareInstance].dataMore.count) {
                CheckMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"checkMore" forIndexPath:indexPath];
                CheckMoreModel *m = [DestinationManager shareInstance].dataCheckMore[4];
                cell.model = m;
                
                return cell;
            } else {
                MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"more" forIndexPath:indexPath];
                MoreModel *m = [DestinationManager shareInstance].dataMore[indexPath.row];
                cell.model = m;
                
                return cell;
            }
            
            break;
        }
            
          
        default:
            break;
    }
    
    return nil;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (tableView.tag) {
        case 101: {
            return (0.45 * SHeight - 70) / 2;
            break;
        }
            
        case 102: {
            if (indexPath.row == 0) {
                return 0.5 * SHeight - 140;
            } else {
                return 70;
            }
            
            break;
        }
            
        case 103: {
            if (indexPath.row == 3) {
                return 70;
            } else {
                return (SHeight - 260) / 3;
            }
            
            break;
        }
            
            
        case 104: {
            if (indexPath.row == 3) {
                return 70;
            } else {
                return (SHeight - 260) / 3;
            }
            
            break;
        }
            
            
        case 105: {
            if (indexPath.row == 0) {
                return 0.5 * SHeight - 140;
                
            } else {
                return 70;
            }
            
            break;
        }
            
            
        case 106: {
            if (indexPath.row == [DestinationManager shareInstance].dataMore.count) {
                return 70;
            } else {
                return (0.568 * SHeight) / 3;
            }
            
            break;
        }
            
            
        default:
            break;
    }

    
    return 0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (tableView.tag) {
        case 101: {
            if (indexPath.row == 1) {
                DestinationImageCollectionViewController *dicvc = [[DestinationImageCollectionViewController alloc] init];
                self.isJumped = YES;
                dicvc.jumpblock = ^ (BOOL jumpState) {
                    self.isJumped = jumpState;
                };

                [self.navigationController pushViewController:dicvc animated:YES];
            }
            
            break;
        }
        case 102: {
            if (indexPath.row == 0) {
//                TravelModel *m = [DestinationManager shareInstance].dataTravel[0];
                DestinationDetailViewController *ddvc = [[DestinationDetailViewController alloc] init];
                ddvc.jumpUrl = [NSString stringWithFormat:@"http://m.mafengwo.cn/weng/now.php?mddid=%@", [DestinationManager shareInstance].infoModel.did];
                self.isJumped = YES;
                ddvc.jumpblock = ^ (BOOL jumpState) {
                    self.isJumped = jumpState;
                };

                [self.navigationController pushViewController:ddvc animated:YES];
            } else {
//                CheckMoreModel *m = [DestinationManager shareInstance].dataCheckMore[0];
                DestinationDetailViewController *ddvc = [[DestinationDetailViewController alloc] init];
                ddvc.jumpUrl = [NSString stringWithFormat:@"http://m.mafengwo.cn/schedule/list/index?mddid=%@", [DestinationManager shareInstance].infoModel.did];
                self.isJumped = YES;
                ddvc.jumpblock = ^ (BOOL jumpState) {
                    self.isJumped = jumpState;
                };

                [self.navigationController pushViewController:ddvc animated:YES];
            }
            
            break;
        }
        case 103: {
            if (indexPath.row == 3) {
//                CheckMoreModel *m = [DestinationManager shareInstance].dataCheckMore[1];
                DestinationDetailViewController *ddvc = [[DestinationDetailViewController alloc] init];
                ddvc.jumpUrl = @"http://m.mafengwo.cn/sales/";
                self.isJumped = YES;
                ddvc.jumpblock = ^ (BOOL jumpState) {
                    self.isJumped = jumpState;
                };

                [self.navigationController pushViewController:ddvc animated:YES];
            } else {
                SaleModel *m = [DestinationManager shareInstance].dataSale[indexPath.row];
                DestinationDetailViewController *ddvc = [[DestinationDetailViewController alloc] init];
                ddvc.jumpUrl = m.jump_url;
                self.isJumped = YES;
                ddvc.jumpblock = ^ (BOOL jumpState) {
                    self.isJumped = jumpState;
                };

                [self.navigationController pushViewController:ddvc animated:YES];
            }
            
            break;
        }
        case 104: {
            if (indexPath.row == 3) {
//                CheckMoreModel *m = [DestinationManager shareInstance].dataCheckMore[2];
                DestinationDetailViewController *ddvc = [[DestinationDetailViewController alloc] init];
                ddvc.jumpUrl = [NSString stringWithFormat:@"http://m.mafengwo.cn/jd/%@/", [DestinationManager shareInstance].infoModel.did];
                self.isJumped = YES;
                ddvc.jumpblock = ^ (BOOL jumpState) {
                    self.isJumped = jumpState;
                };

                [self.navigationController pushViewController:ddvc animated:YES];
            } else {
                GoModel *m = [DestinationManager shareInstance].dataGo[indexPath.row];
                NSLog(@"%@", m.did);
                DestinationDetailViewController *ddvc = [[DestinationDetailViewController alloc] init];
                ddvc.jumpUrl = [NSString stringWithFormat:@"http://m.mafengwo.cn/jd/%@/%@.html", [DestinationManager shareInstance].infoModel.did, m.did];
                self.isJumped = YES;
                ddvc.jumpblock = ^ (BOOL jumpState) {
                    self.isJumped = jumpState;
                };

                [self.navigationController pushViewController:ddvc animated:YES];
                
            }
            break;
        }
        case 105: {
            if (indexPath.row == 1) {
//                CheckMoreModel *m = [DestinationManager shareInstance].dataCheckMore[3];
                DestinationDetailViewController *ddvc = [[DestinationDetailViewController alloc] init];
                ddvc.jumpUrl = [NSString stringWithFormat:@"http://m.mafengwo.cn/cy/gl-%@.html", [DestinationManager shareInstance].infoModel.did];
                self.isJumped = YES;
                ddvc.jumpblock = ^ (BOOL jumpState) {
                    self.isJumped = jumpState;
                };

                [self.navigationController pushViewController:ddvc animated:YES];
            }
            
            break;
        }
        case 106: {
            if (indexPath.row == [DestinationManager shareInstance].dataMore.count) {
//                CheckMoreModel *m = [DestinationManager shareInstance].dataCheckMore[4];
                DestinationDetailViewController *ddvc = [[DestinationDetailViewController alloc] init];
                ddvc.jumpUrl = [NSString stringWithFormat:@"http://m.mafengwo.cn/baike/%@/", [DestinationManager shareInstance].infoModel.did];
                self.isJumped = YES;
                ddvc.jumpblock = ^ (BOOL jumpState) {
                    self.isJumped = jumpState;
                };

                [self.navigationController pushViewController:ddvc animated:YES];
            }
            
            break;
        }
        default:
            break;
    }
    
    
    
}




- (void)cateTapAction:(UITapGestureRecognizer *)sender {
    CateModel *m;
    switch (sender.view.tag) {
        case 1:
            m = [DestinationManager shareInstance].dataCate[0];
            break;
        case 2:
            m = [DestinationManager shareInstance].dataCate[1];
            break;
        case 3:
            m = [DestinationManager shareInstance].dataCate[2];
            break;
        default:
            break;
    }
    
    DestinationDetailViewController *ddvc = [[DestinationDetailViewController alloc] init];
    ddvc.jumpUrl = [NSString stringWithFormat:@"http://m.mafengwo.cn/jd/%@/%@.html", [DestinationManager shareInstance].infoModel.did, m.did];
    self.isJumped = YES;
    ddvc.jumpblock = ^ (BOOL jumpState) {
        self.isJumped = jumpState;
    };

    [self.navigationController pushViewController:ddvc animated:YES];
    
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
