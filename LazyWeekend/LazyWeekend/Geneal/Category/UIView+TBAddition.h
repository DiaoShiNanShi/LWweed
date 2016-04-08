//
//  UIView+TBAddition.h
//  TensWeibo
//
//  Created by MWeit on 16/3/19.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import <UIKit/UIKit.h>

// 设置动画的方向
typedef NS_ENUM(NSUInteger, UIViewAnimationType) {
    UIViewAnimationTypeToTop = 0,
    UIViewAnimationTypeToLeft,
    UIViewAnimationTypeToRight,
    UIViewAnimationTypeToBottom
};

@interface UIView (TBFame)

@property (assign, nonatomic) CGFloat left;
@property (assign, nonatomic) CGFloat right;
@property (assign, nonatomic) CGFloat top;
@property (assign, nonatomic) CGFloat bottom;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;

// 自定义动画
- (void) customAnmation:(UIViewAnimationType) type withValue:(CGFloat)value;

@end
