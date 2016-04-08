//
//  WBBaseModel.h
//  WeiBo
//
//  Created by tens03 on 16/3/16.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWBaseModel : NSObject<NSCoding>

/**
 *  初始化 赋值
 *
 *  @param object <#object description#>
 */
-(instancetype) initWithObject:(id)object;

/**
 *  归档
 */
-(BOOL)archive;


/**
 *  解档
 */
+(instancetype)unArchive;


/**
 *  删档 / 删除文件
 */
+(BOOL) removeArchive;


/**
 *  获取属性列表
 *
 *  @return <#return value description#>
 */
- (NSArray *)propertyList;


@end
