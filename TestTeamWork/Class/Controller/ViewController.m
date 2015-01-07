//
//  ViewController.m
//  TestTeamWork
//
//  Created by 韩扬 on 14/12/9.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)WoeidModel *woeidModel;
@property (nonatomic, strong)WeatherModel *weatherModel;
@property (nonatomic, strong)RefreshScrollView *scrollView;
@property (nonatomic, strong)NavigationView *navi;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [[RYLocationManager sharedRYLocationManager] registeLocationMangerWithDelegate:self];
}
- (void)initUI{
    self.scrollView = [[RefreshScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView.re_Delegate = self;
    [self.view addSubview:self.scrollView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [self.scrollView refresh];
    
    self.navi = [[NavigationView alloc]initWithFrame:CGRectMake(0, 5, SCREENWIDTH, 60)];
    self.navi.delegate = self;
    self.navi.dynamicsDrawerViewController = self.dynamicsDrawerViewController;
    [self.view addSubview:self.navi];
}
- (void)createSearch{
    SearchTableViewController *searchVC = [[SearchTableViewController alloc]initWithNibName:nil bundle:nil];
    searchVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:searchVC animated:YES completion:nil];
}
- (void)WoeidOperationWithLocation:(NSString *)location{
    NSString *sql = [NSString stringWithFormat:@"select woeid from geo.placefinder where text=%@",location];
    [WoeidNetOperation opeartionWithQuery:sql andDelegate:self];;
}
- (void)WeatherOperationWithWoeid:(int)woeid{
    NSString *sql = [NSString stringWithFormat:@"select image,item from weather.forecast where woeid=%d and u=\"c\"",woeid];
    [WeatherNetOperation opeartionWithQuery:sql andDelegate:self];;
}
#pragma mark - 网络请求成功回调
- (void)netOperationDidFinish:(RYNetOperation *)operation{
    if ([operation isKindOfClass:[WoeidNetOperation class]]) {
        self.woeidModel = operation.resultData;
        [self WeatherOperationWithWoeid:self.woeidModel.woeid.integerValue];
    }else if ([operation isKindOfClass:[WeatherNetOperation class]]){
        self.weatherModel = operation.resultData;
        NSLog(@"%@",self.weatherModel);
    }
}
#pragma mark - 网络请求失败回调
- (void)netOperationDidFailed:(RYNetOperation *)operation{
    NSLog(@"%@",operation.error);
}
#pragma mark - 网络状态监测回调
- (void)netStatusChangedCallback:(NSNotification *)note{
    RYNetStatus status = [[RYNetObserver sharedRYNetObserver]status];
    switch (status) {
        case RYNetStatus_WIFI:
        case RYNetStatus_WWAN:
            break;
        case RYNetStatus_NONE:{
            self.weatherModel = [[WeatherModel alloc]initWithId:@"Weather" tableName:TABLE_NAME];
        }
            break;
    }
}
#pragma mark - CLLocationManagerDelegate
// 地理位置发生改变时触发
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *location = [locations lastObject];
    [manager stopUpdatingLocation];
    NSLog(@"%f,%f",location.coordinate.longitude,location.coordinate.latitude);
    //TODO:高德sdk 获取位置信息网络请求传参
}
#pragma mark - RefreshScrollViewDelegate
-(void)reloadData{
    [self WoeidOperationWithLocation:STRING(@"北京")];
}
- (void)dealloc
{
    [self.scrollView removePullToRefresh];
}
@end
