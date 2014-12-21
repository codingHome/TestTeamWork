//
//  RYNetObserver.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/21.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "RYNetObserver.h"

@implementation RYNetObserver

DEFINE_SINGLETON_FOR_CLASS(RYNetObserver)

-(instancetype)init{
    self = [super init];
    if (self) {
        _status = RYNetStatus_NONE;
    }
    return self;
}

/**
 *  开始监听网络状态
 */
- (void)startNotifier
{
    _reach = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    [_reach startNotifier];
}

/**
 *  网络状态发生改变，获取通知回调
 */
- (void)reachabilityChanged:(NSNotification *)note
{
    switch (_reach.currentReachabilityStatus) {
        case ReachableViaWiFi:
            _status = RYNetStatus_WIFI;
            break;
        case ReachableViaWWAN:
            _status = RYNetStatus_WWAN;
            break;
        case NotReachable:
            _status = RYNetStatus_NONE;
            break;
        default:
            break;
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kRYNetStatusChangedNotification object:self];
}

/**
 *  帮助对象注册网络状态变化通知
 */
- (void)registNotification:(NSObject *)obj selector:(SEL)selector
{
    [[NSNotificationCenter defaultCenter] addObserver:obj
                                             selector:selector
                                                 name:kRYNetStatusChangedNotification
                                               object:self];
}

/**
 *  帮助对象注销网络状态变化通知
 */
- (void)removeNotification:(NSObject *)obj
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:obj
                                                    name:kRYNetStatusChangedNotification
                                                  object:nil];
}
@end
