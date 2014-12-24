//
//  PanView.m
//  TestTeamWork
//
//  Created by 杨启晖 on 14/12/24.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "PanView.h"
#import "PanModel.h"

@interface PanView ()
@property (nonatomic, assign)BOOL isExchange;
@property (nonatomic, assign)CGPoint originCenter;
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
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panPView:)];
        [self addGestureRecognizer:pan];
        
        [[PanModel sharedPanModel].views addObject:self];
    }
    return self;
}
-(void)panPView:(UIPanGestureRecognizer*)gr{
    CGPoint location = [gr locationInView:self.superview];
    if (gr.state == UIGestureRecognizerStateBegan) {
        self.alpha = 0.6f;
        [self scaleAnimationWithView:self Value:@0.95];
    }
    if (gr.state == UIGestureRecognizerStateChanged) {
        self.backgroundColor = [UIColor redColor];
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
- (void)exchangeAnimationFirst:(PanView*)firstView Second:(PanView*)secondView{
    [self centerAnimationWithView:firstView Value:secondView.center];
    
    [self centerAnimationWithView:secondView Value:self.originCenter];
    secondView.originCenter = firstView.originCenter;
}
- (void)centerAnimationWithView:(PanView *)view Value:(CGPoint)center{
    POPSpringAnimation *animation1 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    animation1.toValue = [NSValue valueWithCGPoint:center];
    animation1.springSpeed = 10;
    animation1.springBounciness = 15;
    //view.originCenter = center;
    [view pop_addAnimation:animation1 forKey:@"center"];
}
- (void)scaleAnimationWithView:(PanView *)view Value:(NSValue*)value{
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleX];
    scaleAnimation.toValue = value;
    scaleAnimation.springSpeed = 10;
    scaleAnimation.springBounciness = 10;
    [view pop_addAnimation:scaleAnimation forKey:@"scale1"];
}
@end
