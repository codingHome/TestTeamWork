//
//  PanView.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/24.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "PanView.h"
#import "PanModel.h"

#define GAP 10

@interface PanView ()
@property (nonatomic, assign)BOOL isExchange;
@property (nonatomic, assign)CGPoint originCenter;
@property (nonatomic, strong)UILabel *textLabel;
@property (nonatomic, strong)UIImageView *detailImage;
@end

@implementation PanView

-(instancetype)initWithFrame:(CGRect)frame Tag:(NSUInteger)tag{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.8;
        self.tag = tag;
        self.isExchange = NO;
        self.originCenter = self.center;
        self.userInteractionEnabled = YES;
        
        [self sizeToFit];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panPView:)];
        [self addGestureRecognizer:pan];
        
        [[PanModel sharedPanModel].views addObject:self];
    }
    return self;
}
//  添加文本框
-(void)setText:(NSString *)text{
    self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, GAP, self.bounds.size.width, self.bounds.size.height/3)];
    [self.textLabel setNumberOfLines:0];
    self.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    self.textLabel.text = text;
    self.textLabel.font = FONT(23);
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.textLabel sizeToFit];
    [self adjustFrame];
    [self addSubview: self.textLabel];
}
//  添加图像控件
-(void)setImageUrl:(NSString *)imageUrl{
    self.detailImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.textLabel.frame.size.height + GAP, self.bounds.size.width, self.bounds.size.height/3)];
    self.detailImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.detailImage sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    CGFloat height = self.detailImage.image.size.height * self.detailImage.frame.size.width / self.detailImage.image.size.width;
    
    CGRect frame = self.detailImage.frame;
    frame.size.height = height;
    self.detailImage.frame = frame;
    
    [self adjustFrame];
    [self addSubview: self.detailImage];
}
//  调整自身大小
- (void)adjustFrame{
    CGRect frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.textLabel.frame.size.height + self.detailImage.frame.size.height + 3*GAP);
    self.frame = frame;
}
//  拖动手势
-(void)panPView:(UIPanGestureRecognizer*)gr{
    CGPoint location = [gr locationInView:self.superview];
    if (gr.state == UIGestureRecognizerStateBegan) {
        [self scaleAnimationWithView:self Value:@0.95];
    }
    if (gr.state == UIGestureRecognizerStateChanged) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self centerAnimationWithView:self Value:CGPointMake(SCREENWIDTH / 2, location.y)];
        
        for (PanView *view in [PanModel sharedPanModel].views) {
            if (view.tag != self.tag) {
                if (CGRectContainsPoint(view.frame, self.center)) {
                    if (!self.isExchange) {
                        [self exchangeAnimationFirst:self Second:view];
                        self.isExchange = YES;
                    }
                }
            }
        }
    }else if(gr.state == UIGestureRecognizerStateEnded){
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.8f;
        self.originCenter = CGPointMake(self.center.x, location.y);
        self.isExchange = NO;
        [self scaleAnimationWithView:self Value:@1.0];
    }
}
//  视图交换
- (void)exchangeAnimationFirst:(PanView*)firstView Second:(PanView*)secondView{
    [self centerAnimationWithView:firstView Value:secondView.center];
    
    [self centerAnimationWithView:secondView Value:self.originCenter];
    secondView.originCenter = firstView.originCenter;
}
//  POP_CENTER动画
- (void)centerAnimationWithView:(PanView *)view Value:(CGPoint)center{
    POPSpringAnimation *animation1 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    animation1.toValue = [NSValue valueWithCGPoint:center];
    animation1.springSpeed = 15;
    animation1.springBounciness = 15;
    [view pop_addAnimation:animation1 forKey:@"center"];
}
//  POP_SCALE动画
- (void)scaleAnimationWithView:(PanView *)view Value:(NSValue*)value{
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleX];
    scaleAnimation.toValue = value;
    scaleAnimation.springSpeed = 10;
    scaleAnimation.springBounciness = 10;
    [view pop_addAnimation:scaleAnimation forKey:@"scale1"];
}
@end
