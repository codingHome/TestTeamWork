//
//  ViewController.m
//  TestTeamWork
//
//  Created by 韩扬 on 14/12/9.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self WoeidOperationWithLocation:STRING(@"beijing")];
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
        WoeidModel *model = [[WoeidModel alloc]initWithDictionary:operation.responseData error:nil];
        [self WeatherOperationWithWoeid:model.woeid.integerValue];
    }else if ([operation isKindOfClass:[WeatherNetOperation class]]){
        WeatherModel *model = [[WeatherModel alloc]initWithDictionary:operation.responseData error:nil];
        NSLog(@"%@",model);
    }
}
#pragma mark -
#pragma mark 网络请求失败回调
- (void)netOperationDidFailed:(RYNetOperation *)operation{
    NSLog(@"%@",operation.error);
}
@end
