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
    [self ComicOperation];
}
- (void)ComicOperation{
    ComicOperation *operation = [ComicOperation operationWithDelegate:self];
    operation.params = @{
                         @"Con":@1,
                         @"page":@1,
                         @"size":@10,
                         @"argname":@"theme",
                         @"argval":@1
                         };
    [operation start];
}
#pragma mark -
#pragma mark 网络请求成功回调
- (void)netOperationDidFinish:(RYNetOperation *)operation{
    ComicModel *model = [[ComicModel alloc]initWithDictionary:operation.responseData error:nil];
    NSLog(@"%@",model);
}
#pragma mark -
#pragma mark 网络请求失败回调
- (void)netOperationDidFailed:(RYNetOperation *)operation{
    NSLog(@"%@",operation.error);
}
@end
