//
//  PanView.h
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/24.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POP.h"
#import "UIImageView+LoadImage.h"

@interface PanView : UIView
/*
 *  文本
 */
@property (nonatomic, strong)NSString *text;
/*
 *  图像URL
 */
@property (nonatomic, strong)NSString *imageUrl;
/*
 *  初始化&tag
 */
-(instancetype)initWithFrame:(CGRect)frame Tag:(NSUInteger)tag;
@end