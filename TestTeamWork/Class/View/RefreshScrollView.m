//
//  RefreshScrollView.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/23.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "RefreshScrollView.h"
#import "UIImage+BlurImage.h"
#import "UIImage+RTTint.h"

@implementation RefreshScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.alwaysBounceVertical = YES;
        self.backgroundColor = [UIColor whiteColor];
        self.DrawingImgs = [NSMutableArray array];
        self.LoadingImgs = [NSMutableArray array];
        [self creatGifScrollView];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://cc.cocimg.com/api/uploads/20150107/1420592944308019.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            imageView.image = [image blurImageWithBlur:0.2];
        }];
        [self addSubview:imageView];
    }
    return self;
}
- (void)creatGifScrollView{
    for (NSUInteger i  = 0; i <= 31; i++) {
        NSString *fileName = [NSString stringWithFormat:@"sun_%05d.png",i];
        [self.DrawingImgs addObject:[UIImage imageNamed:fileName]];
    }
    for (NSUInteger i  = 31; i <= 109; i++) {
        NSString *fileName = [NSString stringWithFormat:@"sun_%05d.png",i];
        [self.LoadingImgs addObject:[UIImage imageNamed:fileName]];
    }
    __weak __typeof(&*self)weakSelf = self;
    [self addPullToRefreshWithDrawingImgs:self.DrawingImgs andLoadingImgs:self.LoadingImgs andActionHandler:^{
        [weakSelf netRequest];
        [weakSelf performSelector:@selector(didFinishPullToRefresh) withObject:nil afterDelay:2];
    }];
}
-(void)refresh{
    [self netRequest];
}
-(void)netRequest{
    WeatherModel *model = [[WeatherModel alloc]initWithId:@"Weather" tableName:TABLE_NAME];;
    if (model) {
        NSArray *timeArray = [model.created componentsSeparatedByString:@"T"];
        NSString *time = [timeArray[1] substringToIndex:8];
        NSString *date = [timeArray[0] stringByAppendingString:@" "];
        time = [date stringByAppendingString:time];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *upDate = [dateFormatter dateFromString:time];
        
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        NSInteger interval = [zone secondsFromGMTForDate: upDate];
        upDate = [upDate dateByAddingTimeInterval: interval];
        
        self.refreshControl.timeLabel.text = [self compareCurrentTime:upDate];
    }
    [self.re_Delegate reloadData];
}
-(NSString *)compareCurrentTime:(NSDate*) compareDate
{
    NSTimeInterval  timeInterval = [compareDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}
-(void)addSubview:(UIView *)view{
    [super addSubview:view];
    CGSize size = self.bounds.size;
    size.height += view.bounds.size.height;
    self.contentSize = size;
}
@end
