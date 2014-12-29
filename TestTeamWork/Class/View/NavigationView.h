//
//  NavigationView.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/29.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSDynamicsDrawerViewController.h"

@protocol NavigationViewDelegate <NSObject>

- (void)createSearch;

@end

@interface NavigationView : UIView
@property (strong, nonatomic) MSDynamicsDrawerViewController *dynamicsDrawerViewController;
@property (nonatomic, strong)id<NavigationViewDelegate>delegate;
@end
