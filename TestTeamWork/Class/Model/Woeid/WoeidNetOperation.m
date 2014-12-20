//
//  WoeidNetOperation.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/20.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "WoeidNetOperation.h"

@implementation WoeidNetOperation


- (void)configOperation{
    self.url = @"http://query.yahooapis.com/v1/public/yql";
}
-(void)setParams:(NSDictionary *)params{
    NSString *q = [params objectForKey:@"q"];
    q = [q stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    _params = @{
                @"q":q,
                @"format":@"json",
                @"env":@"store%3A%2F%2Fdatatables.org%2Falltableswithkeys",
                @"callback":@""
                };
}
@end
