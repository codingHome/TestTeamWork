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
    [self WoeidOperationWithLocation:@"beijing"];
}
- (void)WoeidOperationWithLocation:(NSString *)location{
    NSString *param = [NSString stringWithFormat:@"select * from geo.placefinder where text=%@",location];
    WoeidNetOperation *operation = [WoeidNetOperation operationWithDelegate:self];
    operation.params = @{
                         @"q":param
                         };
    [operation start];
}
#pragma mark -
#pragma mark 网络请求成功回调
- (void)netOperationDidFinish:(RYNetOperation *)operation{
    
}
#pragma mark -
#pragma mark 网络请求失败回调
- (void)netOperationDidFailed:(RYNetOperation *)operation{
    NSLog(@"%@",operation.error);
}
@end
