//
//  NSMutableArray+LWAddition.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/9.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "NSMutableArray+LWAddition.h"
#define kArcFilePath [NSString stringWithFormat:@"%@/%@",filePath,[self class]]

@implementation NSMutableArray (LWAddition)


#pragma mark - <NSCoding>

// 归档
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self forKey:@"dataArray"];
}


// 接档
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self)
    {
        self = [aDecoder decodeObjectForKey:@"dataArray"];
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

@end
