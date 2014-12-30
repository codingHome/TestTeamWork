//
//  RYLocationManager.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/30.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface RYLocationManager : NSObject<CLLocationManagerDelegate>
DEFINE_SINGLETON_FOR_HEADER(RYLocationManager)
/*
 *  获取位置
 */
- (void)registeLocationMangerWithDelegate:(id<CLLocationManagerDelegate>)vc;
@end
