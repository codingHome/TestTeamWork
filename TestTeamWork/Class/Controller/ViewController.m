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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
    [self registeLocationMangerWithDelegate:self];
}
- (void)updateUI{
    self.scrollView = [[RefreshScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView.re_Delegate = self;
    [self.view addSubview:self.scrollView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [self.scrollView refresh];
    
    PanView *view1 = [[PanView alloc]initWithFrame:CGRectMake(0, 50, SCREENWIDTH, 100) Tag:1];
    view1.text = @"11111";
    [self.scrollView addSubview:view1];
    
    PanView *view2 = [[PanView alloc]initWithFrame:CGRectMake(0, 200, SCREENWIDTH, 100) Tag:2];
    view2.text = @"22222222222222222";
    [self.scrollView addSubview:view2];
    
    PanView *view3 = [[PanView alloc]initWithFrame:CGRectMake(0, 350, SCREENWIDTH, 100) Tag:3];
    view3.text = @"33333333333333333333333333333333333";
    [self.scrollView addSubview:view3];
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
