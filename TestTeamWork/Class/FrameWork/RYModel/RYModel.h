//
//  RYModel.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/20.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "JSONModel.h"
#import "RYCache.h"

@interface RYModel : JSONModel
/*
 *  读取缓存
 */
- (instancetype)initWithId:(NSString *)ID tableName:(NSString *)table;
@end
