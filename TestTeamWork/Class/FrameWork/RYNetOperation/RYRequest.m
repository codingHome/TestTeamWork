//
//  RYRequest.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/18.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "RYRequest.h"

@implementation RYRequest

DEFINE_SINGLETON_FOR_CLASS(RYRequest)

- (void)GET:(NSString *)url
     params:(NSDictionary *)params
   complete:(RYRequestCompletBlock)completeBlock{
    [self GET:url
   parameters:params
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          completeBlock(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completeBlock(nil,error);
    }];
}
- (void)POST:(NSString *)url
      params:(NSDictionary *)params
    complete:(RYRequestCompletBlock)completeBlock{
    [self POST:url
    parameters:params
       success:^(AFHTTPRequestOperation *operation, id responseObject) {
           completeBlock(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completeBlock(nil,error);
    }];
}
@end
