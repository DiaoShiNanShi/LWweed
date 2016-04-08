//
//  NSString+WB_Expand.m
//  WeiBo
//
//  Created by tens03 on 16/3/19.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "NSString+WB_Expand.h"

@implementation NSString (WB_Expand)

- (CGSize)calcTextSizeWith:(UIFont *)font
                 totalSize:(CGSize)totalSize {
    return [self boundingRectWithSize:totalSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: font} context:nil].size;
}

@end
