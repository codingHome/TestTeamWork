//
//  WoeidModel.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/20.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "WoeidModel.h"

@implementation WoeidModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"query.results.Result.woeid": @"woeid"
                                                       }];
}
@end
