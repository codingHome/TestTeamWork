//
//  ForeCastModel.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/21.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "RYModel.h"

@protocol ForeCastModel <NSObject>

@end

@interface ForeCastModel : RYModel
@property (nonatomic, strong)NSString *code;
@property (nonatomic, strong)NSString *date;
@property (nonatomic, strong)NSString *day;
@property (nonatomic, strong)NSString *high;
@property (nonatomic, strong)NSString *low;
@property (nonatomic, strong)NSString *text;
@end
