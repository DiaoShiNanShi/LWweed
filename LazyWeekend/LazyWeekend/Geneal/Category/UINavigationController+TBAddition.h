//
//  UINavigationController+TBAddition.h
//  TensWeibo
//
//  Created by MWeit on 16/3/30.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UINavigationControllerPushType) {
    UINavigationControllerPushTypeFromLeft = 0,
    UINavigationControllerPushTypeFromRight,
    UINavigationControllerPushTypeFromTop,
    UINavigationControllerPushTypeFromBottom
};

@interface UINavigationController (TBAddition) <UINavigationControllerDelegate>

- (void)pushViewController:(UIViewController *)viewController pushType:(UINavigationControllerPushType)pushType animated:(BOOL)animated;

@end
