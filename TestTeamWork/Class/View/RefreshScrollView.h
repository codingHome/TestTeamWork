//
//  RefreshScrollView.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/23.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+GifPullToRefresh.h"

@protocol RefreshScrollViewDelegate <NSObject>

-(void)reloadData;

@end

@interface RefreshScrollView : UIScrollView
@property (nonatomic, strong)NSMutableArray *DrawingImgs;
@property (nonatomic, strong)NSMutableArray *LoadingImgs;
@property (nonatomic, assign)id<RefreshScrollViewDelegate>re_Delegate;
-(void)refresh;
@end
