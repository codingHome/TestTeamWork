//
//  UIScrollView+GifPullToRefresh.m
//  CHGifRefreshControl
//
//  Created by HangChen on 12/1/13.
//  Copyright (c) 2013 Hang Chen (https://github.com/cyndibaby905)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


#import "UIScrollView+GifPullToRefresh.h"
#import <objc/runtime.h>


#define GAP 2
typedef enum
{
    GifPullToRefreshStateDrawing = 0,
    GifPullToRefreshStateLoading,
} GifPullToRefreshState;

@interface CHGifRefreshControl()
- (void)removeObservers;
@end

static char UIScrollViewGifPullToRefresh;
@implementation UIScrollView (GifPullToRefresh)


- (void)setRefreshControl:(CHGifRefreshControl *)pullToRefreshView {
    [self willChangeValueForKey:@"UIScrollViewGifPullToRefresh"];
    objc_setAssociatedObject(self, &UIScrollViewGifPullToRefresh,
                             pullToRefreshView,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"UIScrollViewGifPullToRefresh"];
}

- (CHGifRefreshControl *)refreshControl {
    return objc_getAssociatedObject(self, &UIScrollViewGifPullToRefresh);
}

- (void)addPullToRefreshWithDrawingImgs:(NSArray*)drawingImgs andLoadingImgs:(NSArray*)loadingImgs andActionHandler:(void (^)(void))actionHandler
{
    
    CHGifRefreshControl *view = [[CHGifRefreshControl alloc] initWithFrame:CGRectMake(0, -GifRefreshControlHeight, self.bounds.size.width, GifRefreshControlHeight)];
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        view.originalContentInsectY = 0;
    }
        
    view.scrollView = self;
    view.pullToRefreshActionHandler = actionHandler;
    view.drawingImgs = drawingImgs;
    view.loadingImgs = loadingImgs;
    [self addSubview:view];
    self.refreshControl = view;
}

- (void)removePullToRefresh
{
    [self.refreshControl removeObservers];
}



- (void)didFinishPullToRefresh
{
    [self.refreshControl endLoading];
}


@end


@implementation CHGifRefreshControl {
    GifPullToRefreshState _state;
    BOOL _isTrigged;
    UIImageView *_refreshView;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        _refreshView = [[UIImageView alloc] initWithFrame:CGRectMake(Offset, 0, GifRefreshControlHeight - 5, GifRefreshControlHeight - 5)];
        _refreshView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(Offset + GifRefreshControlHeight + 10, 0, 150, GifRefreshControlHeight)];
        self.timeLabel.font = FONT(13);
        self.timeLabel.backgroundColor = [UIColor clearColor];
        self.timeLabel.textColor = [UIColor whiteColor];
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
        
        WeatherModel *model = [[WeatherModel alloc]initWithId:@"Weather" tableName:TABLE_NAME];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, model.imageWidth, model.imageHeight)];
        [imageView loadImageWithURL:model.imageURL];
        
        
        [self addSubview:_refreshView];
        [self addSubview:self.timeLabel];
        [self addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.top.mas_equalTo(self.mas_top).offset(GAP);
            make.width.mas_equalTo(model.imageWidth);
            make.height.mas_equalTo(model.imageHeight);
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_left);
            make.top.mas_equalTo(self.mas_top).offset(GifRefreshControlHeight/2);
            make.width.mas_equalTo(@150);
            make.height.mas_equalTo(GifRefreshControlHeight/2);
        }];
        
        [_refreshView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.timeLabel.mas_left).offset(-30);
            make.top.mas_equalTo(self.mas_top).offset(GAP);
            make.width.mas_equalTo(GifRefreshControlHeight - 5);
            make.height.mas_equalTo(GifRefreshControlHeight - 5);
        }];
    }
    return self;
}

- (void)dealloc
{
    [self removeObservers];
}

- (void)removeObservers
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    [_scrollView removeObserver:self forKeyPath:@"pan.state"];
    _scrollView = nil;
}


- (void)setScrollView:(UIScrollView *)scrollView
{
    
    [self removeObservers];
    _scrollView = scrollView;
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    [_scrollView addObserver:self forKeyPath:@"pan.state" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (self.scrollView.contentOffset.y + self.originalContentInsectY <= 0) {
        if ([keyPath isEqualToString:@"pan.state"]) {
            if (self.scrollView.panGestureRecognizer.state == UIGestureRecognizerStateEnded && _isTrigged) {
                [self setState:GifPullToRefreshStateLoading];
                [UIView animateWithDuration:0.2
                                      delay:0
                                    options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState
                                 animations:^{
                                     self.scrollView.contentOffset = CGPointMake(0, -GifRefreshControlHeight - self.originalContentInsectY);
                                     self.scrollView.contentInset = UIEdgeInsetsMake(GifRefreshControlHeight + self.originalContentInsectY, 0.0f, 0.0f, 0.0f);
 
                                 }
                                 completion:^(BOOL finished) {
                                     if (self.pullToRefreshActionHandler) {
                                         self.pullToRefreshActionHandler();
                                     }
                                 }];
            }
        }
        else if([keyPath isEqualToString:@"contentOffset"]){
            [self scrollViewContentOffsetChanged];
        }
       
    }
    
}

- (void)scrollViewContentOffsetChanged
{
    if (_state != GifPullToRefreshStateLoading) {
        if (self.scrollView.isDragging && self.scrollView.contentOffset.y + self.originalContentInsectY < -GifRefreshControlHeight && !_isTrigged) {
            _isTrigged = YES;
        }
        else {
            if (self.scrollView.isDragging && self.scrollView.contentOffset.y + self.originalContentInsectY > -GifRefreshControlHeight) {
                _isTrigged = NO;
            }
            [self setState:GifPullToRefreshStateDrawing];
        }
    }
}


- (void)setState:(GifPullToRefreshState)aState{
	
	CGFloat offset = -(self.scrollView.contentOffset.y + self.originalContentInsectY);
    CGFloat percent = 0;
    if (offset < 0) {
        offset = 0;
    }
    if (offset > GifRefreshControlHeight) {
        offset = GifRefreshControlHeight;
    }
    percent = offset / GifRefreshControlHeight;
    NSUInteger drawingIndex = percent * (self.drawingImgs.count - 1);
	switch (aState)
	{
            
        case GifPullToRefreshStateDrawing:
            [_refreshView stopAnimating];
            _refreshView.image = self.drawingImgs[drawingIndex];
            
            break;
            
		case GifPullToRefreshStateLoading:
            _refreshView.animationImages = self.loadingImgs;
            _refreshView.animationDuration = (CGFloat)self.loadingImgs.count/20.0;
            [_refreshView startAnimating];
            break;
		default:
            break;
	}
	
	_state = aState;
	
}

- (void)endLoading
{
    if (_state == GifPullToRefreshStateLoading) {
        _isTrigged = NO;

        [self setState:GifPullToRefreshStateDrawing];
        
        [UIView animateWithDuration:0.2
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.scrollView.contentInset = UIEdgeInsetsMake(self.originalContentInsectY, 0.0f, 0.0f, 0.0f);
                         }
                         completion:nil];
    }
}


@end
