//
//  OrderModel.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/18.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "JSONModel.h"

@protocol OrderModel <NSObject>

@end

@interface OrderModel : JSONModel
@property (nonatomic, strong)NSString *accredit;
@property (nonatomic, strong)NSString *comicID;
@property (nonatomic, strong)NSString *cover;
@property (nonatomic, strong)NSString *des;
@property (nonatomic, strong)NSString *isDujia;
@property (nonatomic, strong)NSString *lastUpdateTime;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *nickname;
@end
