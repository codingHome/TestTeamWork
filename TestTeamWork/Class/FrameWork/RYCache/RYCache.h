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
 *  地理编码归档
 */
-(void)putWoeidIntoTableWith:(NSDictionary*)dict;
/*
 *  地理编码取档
 */
-(id)getWoeid;
/*
 *  天气归档
 */
-(void)putWeatherIntoTableWith:(NSDictionary*)dict;
/*
 *  天气取档
 */
-(id)getWeather;
@end
