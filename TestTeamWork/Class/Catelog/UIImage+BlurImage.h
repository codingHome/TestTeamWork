//
//  UIImage+BlurImage.h
//  TestTeamWork
//
//  Created by 杨启晖 on 15/1/7.
//  Copyright (c) 2015年 GE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>

@interface UIImage (BlurImage)
/*
 *  图像模糊
 */
- (UIImage *)blurImageWithBlur:(CGFloat)blur;
@end
