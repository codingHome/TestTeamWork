//
//  NavigationView.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/29.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "NavigationView.h"

@implementation NavigationView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(3, 0, 60, 60)];
        [leftButton setImage:[UIImage imageNamed:@"Left Reveal Icon"] forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(dynamicsDrawerRevealLeftBarButtonItemTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:leftButton];
        
        UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH - 62, 0, 60, 60)];
        [rightButton setImage:[UIImage imageNamed:@"Right Reveal Icon"] forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(citySearch) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rightButton];
    }
    return self;
}
- (void)dynamicsDrawerRevealLeftBarButtonItemTapped{
    [self.dynamicsDrawerViewController setPaneState:MSDynamicsDrawerPaneStateOpen inDirection:MSDynamicsDrawerDirectionLeft animated:YES allowUserInterruption:YES completion:nil];
}
- (void)citySearch{
    [self.delegate createSearch];
}
@end
