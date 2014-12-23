//
//  RefreshScrollView.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/23.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "RefreshScrollView.h"

@implementation RefreshScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.alwaysBounceVertical = YES;
        self.backgroundColor = [UIColor whiteColor];
        self.DrawingImgs = [NSMutableArray array];
        self.LoadingImgs = [NSMutableArray array];
        [self creatGifScrollView];
    }
    return self;
}
- (void)creatGifScrollView{
    for (NSUInteger i  = 0; i <= 29; i++) {
        NSString *fileName = [NSString stringWithFormat:@"sun_%05d.png",i];
        [self.DrawingImgs addObject:[UIImage imageNamed:fileName]];
    }
    for (NSUInteger i  = 30; i <= 109; i++) {
        NSString *fileName = [NSString stringWithFormat:@"sun_%05d.png",i];
        [self.LoadingImgs addObject:[UIImage imageNamed:fileName]];
    }
    __weak __typeof(&*self)weakSelf = self;
    [self addPullToRefreshWithDrawingImgs:self.DrawingImgs andLoadingImgs:self.LoadingImgs andActionHandler:^{
        [weakSelf.re_Delegate refresh];
        [weakSelf performSelector:@selector(didFinishPullToRefresh) withObject:nil afterDelay:2];
    }];
}
@end
