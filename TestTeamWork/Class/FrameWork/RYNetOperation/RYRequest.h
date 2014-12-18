//
//  RYRequest.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/18.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

typedef void (^RYRequestCompletBlock) (id result, NSError *error);

@interface RYRequest : AFHTTPRequestOperationManager

DEFINE_SINGLETON_FOR_HEADER(RYRequest)

/**
 *  GET请求
 *  @param url           请求链接
 *  @param params        请求参数
 *  @param completeBlock 请求完成回调
 */
- (void)GET:(NSString *)url
     params:(NSDictionary *)params
   complete:(RYRequestCompletBlock)completeBlock;
/**
 *  POST请求
 *
 *  @param url           请求链接
 *  @param params        请求参数
 *  @param completeBlock 请求完成回调
 */
- (void)POST:(NSString *)url
      params:(NSDictionary *)params
    complete:(RYRequestCompletBlock)completeBlock;
@end
