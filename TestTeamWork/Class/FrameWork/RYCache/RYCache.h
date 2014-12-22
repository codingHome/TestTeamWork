//
//  RYCache.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/21.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "YTKKeyValueStore.h"

@interface RYCache : YTKKeyValueStore
DEFINE_SINGLETON_FOR_HEADER(RYCache);

/*
 *  数据归档
 */
-(void)putObjectIntoTableWith:(NSDictionary*)dict id:(NSString *)ID tableName:(NSString*)table;
/*
 *  数据取档
 */
-(id)getObjectWithId:(NSString *)ID tableName:(NSString*)table;

@end
