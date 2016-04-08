//
//  UINavigationController+TBAddition.m
//  TensWeibo
//
//  Created by MWeit on 16/3/30.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "UINavigationController+TBAddition.h"
#import <objc/runtime.h>
#import "LWPushAnimation.h"

const char *pushTypeKey;

@implementation UINavigationController (TBAddition)

- (void)pushViewController:(UIViewController *)viewController pushType:(UINavigationControllerPushType)pushType animated:(BOOL)animated {
    
    objc_setAssociatedObject(self, pushTypeKey, @(pushType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.delegate = self;
    
    [self pushViewController:viewController animated:YES];
}


#pragma mark - UINavigationControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    
    
    
    UINavigationControllerPushType pushType = [objc_getAssociatedObject(self, pushTypeKey) intValue];
    return [[LWPushAnimation alloc] initWithPushType:pushType];
}

@end
