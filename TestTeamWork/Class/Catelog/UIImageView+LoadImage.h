//
//  UIImageView+LoadImage.h
//  TestTeamWork
//
//  Created by 杨启晖 on 15/1/5.
//  Copyright (c) 2015年 GE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
@interface UIImageView (LoadImage)
/*
 *  加载图片
 */
- (void)loadImageWithURL:(NSString *)url;
/*
 *  加载图片（默认图片）
 */
- (void)loadImageWithURL:(NSString *)url placeholderImage:(NSString *)placeholder;
@end
