//
//  TBPushAnimation.h
//  TensWeibo
//
//  Created by MWeit on 16/3/30.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface LWPushAnimation : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWithPushType:(UINavigationControllerPushType)pushType;

@property (assign, nonatomic) UINavigationControllerPushType pushType;

@end
