//
//  RYLocationManager.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/30.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "RYLocationManager.h"

@implementation RYLocationManager
DEFINE_SINGLETON_FOR_CLASS(RYLocationManager)
- (void)registeLocationMangerWithDelegate:(id<CLLocationManagerDelegate>)vc{
    CLLocationManager *manager = [[CLLocationManager alloc]init];
    if ([CLLocationManager locationServicesEnabled]) {
        if (SYSTEMVERSION >= 8.0){
            [manager requestAlwaysAuthorization];
        }
        manager.delegate=vc;
        manager.desiredAccuracy=kCLLocationAccuracyBest;
        manager.distanceFilter = 10;
        //开始更新经纬度
        [manager startUpdatingLocation];
    }
}
@end
