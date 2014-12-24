//
//  PanModel.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/24.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "PanModel.h"

@implementation PanModel
DEFINE_SINGLETON_FOR_CLASS(PanModel);
-(instancetype)init{
    self = [super init];
    if (self) {
        self.views = [NSMutableArray array];
    }
    return self;
}
@end
