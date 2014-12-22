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
- (void)getcompleteURL
{
    NSString *completeURL;
    
    if (self.url && !self.params) {
        
        completeURL = self.url;
        
    }else {
        
        completeURL = [NSString stringWithFormat:@"%@?%@", self.url, [self.params operationURL]];
    }
    
    _completeURL = completeURL;
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
    [self getcompleteURL];
}

- (void)postRequest
{
    RYRequest *request = [RYRequest sharedRYRequest];
    
    [request POST:_url params:_params complete:^(id result, NSError *error) {
        [self requestComplete:result error:error];
    }];
    [self getcompleteURL];
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
- (void)transforModel{
    NSString *classString = [NSString stringWithFormat:@"%@",[self class]];
    classString = [classString substringToIndex:[classString rangeOfString:@"NetOperation"].location];
    NSString *modelString = [NSString stringWithFormat:@"%@Model",classString];

    _resultData = [[NSClassFromString(modelString) alloc]initWithDictionary:_responseData error:nil];
    [[RYCache sharedRYCache]putObjectIntoTableWith:_responseData id:classString tableName:TABLE_NAME];
}
#pragma mark -
#pragma mark - Callback Handle

- (void)successCallback
{
    [self transforModel];
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
#pragma mark -
#pragma mark YQLRequest

+ (instancetype)opeartionWithQuery:(NSString *)statement andDelegate:(id<RYNetOperationDelegate>)delegate{
    
    RYNetOperation *operation = [[[self class]alloc]init];
    operation.delegate = delegate;
    [operation dataRequestWirhStatement:statement];
    
    return operation;
}

- (void)dataRequestWirhStatement:(NSString *)statement{
    NSString *query = [NSString stringWithFormat:@"%@%@%@", QUERY_PREFIX, [statement stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding], QUERY_SUFFIX];
    
    NSData *jsonData = [[NSString stringWithContentsOfURL:[NSURL URLWithString:query] encoding:NSUTF8StringEncoding error:nil] dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *result = nil;
    
    if (jsonData) {
        result = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (error) {
            _error = error;
            [self failedCallback];
        }
        _responseData = result;
        [self successCallback];
    }else{
        _error = [[NSError alloc]initWithDomain:@"数据错误" code:-1 userInfo:nil];;
        [self failedCallback];
    }
}
@end
