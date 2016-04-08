//
//  UIColor+TBAddition.h
//  TensWeibo
//
//  Created by MWeit on 16/3/16.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (TBAddition)

/**
 *  直接传rgb数值，不用除以255
 */
+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha;

@end
