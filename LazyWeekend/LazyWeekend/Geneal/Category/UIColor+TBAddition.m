//
//  UIColor+TBAddition.m
//  TensWeibo
//
//  Created by MWeit on 16/3/16.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "UIColor+TBAddition.h"

@implementation UIColor (TBAddition)


+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha {
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}

@end
