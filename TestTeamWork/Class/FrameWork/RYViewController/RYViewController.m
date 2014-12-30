//
//  RYViewController.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/21.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "RYViewController.h"

@implementation RYViewController
-(void)viewDidLoad{
    [[RYNetObserver sharedRYNetObserver]startNotifier];
    [[RYNetObserver sharedRYNetObserver]registNotification:self selector:@selector(netStatusChangedCallback:)];
    [UIApplication sharedApplication].statusBarHidden = YES;
}
- (void)netStatusChangedCallback:(NSNotification *)note{
    
}

@end
