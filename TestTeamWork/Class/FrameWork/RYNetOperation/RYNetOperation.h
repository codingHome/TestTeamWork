//
//  RYNetOperation.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/18.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYRequest.h"
#import "NSDictionary+OperationURL.h"

#define QUERY_PREFIX @"http://query.yahooapis.com/v1/public/yql?q="
#define QUERY_SUFFIX @"&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="

@class RYNetOperation;
#pragma mark -
#pragma mark RYNetOperationDelegate
@protocol RYNetOperationDelegate <NSObject>

- (void)netOperationDidFinish:(RYNetOperation *)operation;
- (void)netOperationDidFailed:(RYNetOperation *)operation;

@end

@interface RYNetOperation : NSObject{
@protected NSDictionary *_params;
}
/**
 *  代理
 */
@property (nonatomic, assign) id<RYNetOperationDelegate> delegate;
/**
 *  请求服务器URL
 */
@property (nonatomic, copy)   NSString *url;
/**
 *  请求参数
 */
@property (nonatomic, strong) NSDictionary *params;
/**
 *  完整的GET_URL
 */
@property (nonatomic, copy, readonly) NSString *completeURL;
/**
 *  请求方法
 */
@property (nonatomic, copy) NSString *method;
/**
 *  请求响应Json字典
 */
@property (nonatomic, strong) NSDictionary *responseData;

/**
 *  返回Json数据源的标签
 */
@property (nonatomic, strong) NSString *responseDataTag;
/**
 *  请求响应解析数组
 */
@property (nonatomic, strong) NSArray *dataArray;
/**
 *  请求报错信息
 */
@property (nonatomic, strong) NSError *error;

/**
 *  初始化请求任务对象
 */
+ (id)operationWithDelegate:(id<RYNetOperationDelegate>)delegate;

/**
 *  开始请求任务
 */
- (void)start;

/**
 *  配置网络请求任务
 */
- (void)configOperation;

#pragma mark -
#pragma mark YQLRequest
+ (instancetype)opeartionWithQuery:(NSString *)statement andDelegate:(id<RYNetOperationDelegate>)delegate;

@end
