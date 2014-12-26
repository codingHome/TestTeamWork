//
//  RYModel.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/20.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "RYModel.h"

@implementation RYModel
- (instancetype)initWithId:(NSString *)ID tableName:(NSString *)table{
    self = [super init];
    if (self) {
        NSDictionary *dict = [[RYCache sharedRYCache]getObjectWithId:ID tableName:table];
        self = [self initWithDictionary:dict error:nil];
    }
    return self;
}
@end
