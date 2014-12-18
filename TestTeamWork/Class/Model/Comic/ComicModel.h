//
//  ComicModel.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/18.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "RYNetOperation.h"
#import "JSONModel.h"
#import "OrderModel.h"

@interface ComicModel : JSONModel
@property (nonatomic, strong)NSArray<OrderModel>*data;
@property (nonatomic ,strong)NSString *total;
@end
