//
//  RYViewController.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/21.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYNetObserver.h"
#import <CoreLocation/CoreLocation.h>

#define STRING(x) [NSString stringWithFormat:@"\"%@\"",x]

@interface RYViewController : UIViewController<CLLocationManagerDelegate>
/*
 *  获取位置
 */
- (void)registeLocationMangerWithDelegate:(id<CLLocationManagerDelegate>)vc;
@end
