//
//  NSMutableArray+LWAddition.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/9.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (LWAddition)<NSCoding>

/**
 *  归档
 */
-(BOOL)archive;


/**
 *  解档
 */
+(instancetype)unArchive;


@end
