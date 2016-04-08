//
//  TBPushAnimation.m
//  TensWeibo
//
//  Created by MWeit on 16/3/30.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "LWPushAnimation.h"

@implementation LWPushAnimation

- (instancetype)initWithPushType:(UINavigationControllerPushType)pushType {
    self = [super init];
    if (self) {
        self.pushType = pushType;
    }
    return self;
}

// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.25;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    [[transitionContext containerView] addSubview:toView];
    
    CGRect begainFrame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    CGRect endFrame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);

    switch (self.pushType) {
        case UINavigationControllerPushTypeFromLeft:
        {
            begainFrame.origin.x = -kScreenWidth;
            break;
        }
        case UINavigationControllerPushTypeFromRight: {
            begainFrame.origin.x = kScreenWidth;
            break;
        }
        case UINavigationControllerPushTypeFromTop: {
            begainFrame.origin.y = -kScreenHeight;
            break;
        }
        case UINavigationControllerPushTypeFromBottom: {
            begainFrame.origin.y = kScreenHeight;
        }
    }
    
    toView.frame = begainFrame;

    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        toView.frame = endFrame;
    } completion:^(BOOL finished) {
        if (![transitionContext transitionWasCancelled]) {
            [fromView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }
        else {
            [toView removeFromSuperview];
            [transitionContext completeTransition:NO];
        }
    }];
}

@end
