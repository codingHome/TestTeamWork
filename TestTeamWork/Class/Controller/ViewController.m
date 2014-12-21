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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)WoeidOperationWithLocation:(NSString *)location{
    NSString *sql = [NSString stringWithFormat:@"select woeid from geo.placefinder where text=%@",location];
    [WoeidNetOperation opeartionWithQuery:sql andDelegate:self];;
}
- (void)WeatherOperationWithWoeid:(int)woeid{
    NSString *sql = [NSString stringWithFormat:@"select item from weather.forecast where woeid=%d and u=\"c\"",woeid];
    [WeatherNetOperation opeartionWithQuery:sql andDelegate:self];;
}
#pragma mark -
#pragma mark 网络请求成功回调
- (void)netOperationDidFinish:(RYNetOperation *)operation{
    if ([operation isKindOfClass:[WoeidNetOperation class]]) {
        self.woeidModel = [[WoeidModel alloc]initWithDictionary:operation.responseData error:nil];
        [[RYCache sharedRYCache]putWoeidIntoTableWith:operation.responseData];
        [self WeatherOperationWithWoeid:self.woeidModel.woeid.integerValue];
    }else if ([operation isKindOfClass:[WeatherNetOperation class]]){
        self.weatherModel = [[WeatherModel alloc]initWithDictionary:operation.responseData error:nil];
        [[RYCache sharedRYCache]putWeatherIntoTableWith:operation.responseData];
        NSLog(@"%@",self.weatherModel);
    }
}
#pragma mark -
#pragma mark 网络请求失败回调
- (void)netOperationDidFailed:(RYNetOperation *)operation{
    NSLog(@"%@",operation.error);
}
#pragma mark -
#pragma mark 网络状态监测回调
- (void)netStatusChangedCallback:(NSNotification *)note{
    RYNetStatus status = [[RYNetObserver sharedRYNetObserver]status];
    switch (status) {
        case RYNetStatus_WIFI:
        case RYNetStatus_WWAN:
            [self WoeidOperationWithLocation:STRING(@"beijing")];
            break;
        case RYNetStatus_NONE:{
            NSDictionary *dict = [[RYCache sharedRYCache]getWeather];
            self.weatherModel = [[WeatherModel alloc]initWithDictionary:dict error:nil];
        }
            break;
    }
}
@end
