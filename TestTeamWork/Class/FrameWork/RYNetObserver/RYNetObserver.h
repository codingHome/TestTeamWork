//
//  RYNetObserver.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/21.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
//  网络状态
typedef enum {
    RYNetStatus_NONE,
    RYNetStatus_WIFI,
    RYNetStatus_WWAN
}RYNetStatus;

// 注册通知
#define kRYNetStatusChangedNotification @"kRYNetStatusChangedNotification"

@interface RYNetObserver : NSObject{
    Reachability *_reach;
}
/**
 *  当前网络状态
 */
@property (nonatomic, assign, readonly)RYNetStatus status;
DEFINE_SINGLETON_FOR_HEADER(RYNetObserver);

/**
 *  开始监听网络状态
 */
- (void)startNotifier;

/**
 *  帮助对象注册网络状态变化通知
 */
- (void)registNotification:(NSObject *)obj selector:(SEL)selector;

/**
 *  帮助对象注销网络状态变化通知
 *
 *  @param obj 注销通知对象
 */
- (void)removeNotification:(NSObject *)obj;

@end
