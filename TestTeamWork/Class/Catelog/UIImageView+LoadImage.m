//
//  UIImageView+LoadImage.m
//  TestTeamWork
//
//  Created by 杨启晖 on 15/1/5.
//  Copyright (c) 2015年 GE. All rights reserved.
//

#import "UIImageView+LoadImage.h"

@implementation UIImageView (LoadImage)
- (void)loadImageWithURL:(NSString *)url{
    [self sd_setImageWithURL:[NSURL URLWithString:url]];
}
- (void)loadImageWithURL:(NSString *)url placeholderImage:(NSString *)placeholder{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholder]];
}
@end
