//
//  PanModel.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/24.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PanModel : NSObject
DEFINE_SINGLETON_FOR_HEADER(PanModel);
@property (nonatomic, strong)NSMutableArray *views;
@end
