//
//  WeatherModel.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/21.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"query.created":@"created",
                                                       @"query.results.channel.image.url":@"imageURL",
                                                       @"query.results.channel.image.width":@"imageWidth",
                                                       @"query.results.channel.image.height":@"imageHeight",
                                                       @"query.results.channel.item.forecast": @"forecast",
                                                       @"query.results.channel.item.condition": @"condition"
                                                       
                                                       }];
}
@end
