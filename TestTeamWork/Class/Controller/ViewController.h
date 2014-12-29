//
//  ViewController.h
//  TestTeamWork
//
//  Created by 韩扬 on 14/12/9.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYViewController.h"
#import "ControllerHeader.h"

@interface ViewController : RYViewController <RYNetOperationDelegate,CLLocationManagerDelegate,RefreshScrollViewDelegate,NavigationViewDelegate>
@property (strong, nonatomic) MSDynamicsDrawerViewController *dynamicsDrawerViewController;
@end

