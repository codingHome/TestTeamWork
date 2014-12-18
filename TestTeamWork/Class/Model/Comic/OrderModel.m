//
//  OrderModel.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/18.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"accredit":@"accredit",
                                                       @"comic_id":@"comicID",
                                                       @"cover":@"cover",
                                                       @"description":@"des",
                                                       @"is_dujia":@"isDujia",
                                                       @"last_update_time":@"lastUpdateTime",
                                                       @"name":@"name",
                                                       @"nickname":@"nickname"
                                                       }];
}
@end
