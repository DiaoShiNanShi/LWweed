//
//  WBBaseModel.m
//  WeiBo
//
//  Created by tens03 on 16/3/16.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseModel.h"
#import <objc/runtime.h>

#define kArcFilePath [NSString stringWithFormat:@"%@/%@",filePath,[self class]]

@implementation LWBaseModel


- (instancetype)initWithObject:(id)object
{
    
    self = [super init];
    if(self)
    {
        // 判断类型
        if([object isKindOfClass:[NSDictionary class]])
        {
            [self setValuesForKeysWithDictionary:object];
            
        }else if([object isKindOfClass:[NSData class]])
        {
            NSError *err;
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:object options:NSJSONReadingMutableContainers error:&err];
            if(!err)
            {
                [self setValuesForKeysWithDictionary:dic];
            }else
            {
                NSLog(@"转换出错");
                return nil;
            }
            
        }else
        {
            NSLog(@"只能为字典  获取data");
            return nil;
        }
        
    }
    return self;
}

/**
 *  返回当前对象的属性列表
 */
- (NSArray *)propertyList {
    
    unsigned int propertyCount;
    objc_property_t *propertyList = class_copyPropertyList([self class], &propertyCount);
    
    NSMutableArray *propertyNames = [NSMutableArray array];
    
    for (int i=0; i<propertyCount; i++) {
        
        objc_property_t property = propertyList[i];
        
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        
        [propertyNames addObject:name];
    }
    return propertyNames;
}


#pragma mark - <NSCoding>
/**
 *  编码代理方法
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    for (NSString *itemName in [self propertyList]) {
        [aCoder encodeObject:[self valueForKey:itemName] forKey:itemName];
    }
}

/**
 *  解码代理方法
 */
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self)
    {
        for (NSString *itemName in [self propertyList]) {
            // 获取属性值
            id value = [aDecoder decodeObjectForKey:itemName];
            // 为当前对象设置属性值
            [self setValue:value forKey:itemName];
        }
    }
    return self;
}

/**
 *  归档
 */
- (BOOL)archive
{
     return [NSKeyedArchiver archiveRootObject:self toFile:kArcFilePath];
}

/**
 *  解档
 */
+ (instancetype)unArchive
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:kArcFilePath];
}

/**
 *  删档 /  删除文件
 */
+ (BOOL)removeArchive
{
    return [[NSFileManager defaultManager] removeItemAtPath:kArcFilePath error:nil];
}


/**
 *  拼接get请求地址
 *
 *  @return <#return value description#>
 */
- (NSString *)description
{
    NSMutableString *string = [NSMutableString stringWithString:@"?"];
    
    for (NSString *name in [self propertyList]) {
        
        id value = [self valueForKey:name];
        
        if (value == nil) {
            continue;
        }
        
        [string appendString:[NSString stringWithFormat:@"%@=%@&", [name isEqualToString:@"idstr"] ? @"id" : name, value]];
    }
    
    return string;
}

@end
