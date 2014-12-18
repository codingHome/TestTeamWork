//
//  RYNetOperation.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/18.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "RYNetOperation.h"

@implementation RYNetOperation
/**
 *  初始化
 */
+ (id)operationWithDelegate:(id<RYNetOperationDelegate>)delegate
{
    RYNetOperation *operation = [[[self class] alloc] init];
    operation.delegate = delegate;
    
    return operation;
}
- (id)init
{
    if (self = [super init]) {
        
        // 默认URL为空
        self.url = nil;
        
        // 默认GET方法
        self.method = @"GET";
        
        // 默认响应标签为data
        self.responseDataTag = @"data";
        
        // 用户自定义匹配
        [self configOperation];
    }
    
    return self;
}
#pragma mark -
#pragma mark - Getting

/**
 *  完整的URL路径
 */
- (NSString *)completeURL
{
    NSString *completeURL;
    
    if (self.url && !self.params) {
        
        completeURL = self.url;
        
    }else {
        
        completeURL = [NSString stringWithFormat:@"%@?%@", self.url, [self.params operationURL]];
    }
    
    return completeURL;
}
/**
 *  配置信息
 */
- (void)configOperation
{
    
}
/**
 *  开始任务
 */
- (void)start
{
    [self execute];
}
- (void)execute
{
    if ([self.method isEqualToString:@"GET"]) {
        
        [self getRequest];
        
    }else if ([self.method isEqualToString:@"POST"]) {
        
        [self postRequest];
        
    }else {
        
        NSLog(@"%@类 Method参数设置出错.", [self class]);
        
    }
}
- (void)getRequest
{
    RYRequest *request = [RYRequest sharedRYRequest];
    
    [request GET:_url
          params:_params
        complete:^(id result, NSError *error) {
            [self requestComplete:result error:error];
        }];
    [self completeURL];
}

- (void)postRequest
{
    RYRequest *request = [RYRequest sharedRYRequest];
    
    [request POST:_url params:_params complete:^(id result, NSError *error) {
        [self requestComplete:result error:error];
    }];
    [self completeURL];
}
- (void)requestComplete:(id)result error:(NSError *)error
{
    if (error) {
        _error = error;
        [self failedCallback];
    }else{
        _responseData = result;
        [self successCallback];
    }
}
#pragma mark -
#pragma mark - Callback Handle

- (void)successCallback
{
    // 请求成功回调
    if (self.delegate && [self.delegate respondsToSelector:@selector(netOperationDidFinish:)]) {
        [self.delegate performSelector:@selector(netOperationDidFinish:)
                            withObject:self];
    }
}

- (void)failedCallback
{
    // 请求失败回调
    if (self.delegate && [self.delegate respondsToSelector:@selector(netOperationDidFailed:)]) {
        [self.delegate performSelector:@selector(netOperationDidFailed:)
                            withObject:self];
    }
}

@end
