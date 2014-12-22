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

-(instancetype)init{
    self = [super initDBWithName:DBNAME];
    if (self) {
        
    }
    return self;
}
-(void)putObjectIntoTableWith:(NSDictionary*)dict id:(NSString *)ID tableName:(NSString*)table{
    [self createTableWithName:table];
    [self deleteObjectById:ID fromTable:table];
    [self putObject:dict withId:ID intoTable:table];
}
-(id)getObjectWithId:(NSString *)ID tableName:(NSString*)table{
    return [self getObjectById:ID fromTable:table];
}
@end
