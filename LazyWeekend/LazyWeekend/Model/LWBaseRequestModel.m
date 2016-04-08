//
//  WBBaseRequestModel.m
//  WeiBo
//
//  Created by tens03 on 16/3/16.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseRequestModel.h"
#import <objc/runtime.h>

@implementation LWBaseRequestModel

/**
 *  把当前对象转换成字典
 */
-(NSData *)conversionData
{
    return [NSJSONSerialization dataWithJSONObject:[self conversionDictionary] options:NSJSONWritingPrettyPrinted error:nil];
}

/**
 *  把当前对象转换成字典 最后需要的就是字典
 */
- (NSDictionary *)conversionDictionary
{
    return [self dictionaryWithValuesForKeys:[self propertyList]];
}

@end
