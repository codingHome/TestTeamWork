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
                         @"size":@50,
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
    [self upComicLib:model];
}
#pragma mark -
#pragma mark 网络请求失败回调
- (void)netOperationDidFailed:(RYNetOperation *)operation{
    NSLog(@"%@",operation.error);
}
- (void)upComicLib:(ComicModel*)model{
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.backgroundColor = [UIColor blackColor];
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    UIView *container = [[UIView alloc]init];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(scrollView);
        make.width.mas_equalTo(scrollView);
    }];
    
    UIImageView *lastView = nil;
    
    for (int i = 0; i < model.data.count; i ++) {
        OrderModel *orderModel = model.data[i];
        UIImageView *subView = [[UIImageView alloc]init];
        
        [subView sd_setImageWithURL:[NSURL URLWithString:orderModel.cover]];
        
        [container addSubview:subView];
        
        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.mas_equalTo(container);
            make.height.mas_equalTo(scrollView.mas_height);
            
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            }else{
                make.top.mas_equalTo(container.mas_top);
            }
            
        }];
        
        lastView = subView;
    }
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(lastView.mas_bottom);
    }];
}
@end
