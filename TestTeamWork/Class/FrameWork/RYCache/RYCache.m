//
//  RYCache.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/21.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "RYCache.h"

@implementation RYCache

DEFINE_SINGLETON_FOR_CLASS(RYCache)

#define DBNAME @"cache.db"
#define WOEIDTABLE @"woeid_table"
#define WEATHERTABLE @"weather_table"

-(instancetype)init{
    self = [super initDBWithName:DBNAME];
    if (self) {
        
    }
    return self;
}
-(void)putWoeidIntoTableWith:(NSDictionary*)dict{
    [self createTableWithName:WOEIDTABLE];
    [self deleteObjectById:@"woeid" fromTable:WOEIDTABLE];
    [self putObject:dict withId:@"woeid" intoTable:WOEIDTABLE];
}
-(id)getWoeid{
    return [self getObjectById:@"woeid" fromTable:WOEIDTABLE];
}
-(void)putWeatherIntoTableWith:(NSDictionary*)dict{
    [self createTableWithName:WEATHERTABLE];
    [self deleteObjectById:@"weather" fromTable:WEATHERTABLE];
    [self putObject:dict withId:@"weather" intoTable:WEATHERTABLE];
}
-(id)getWeather{
    return [self getObjectById:@"weather" fromTable:WEATHERTABLE];
}
@end
