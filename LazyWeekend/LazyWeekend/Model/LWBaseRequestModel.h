//
//  WBBaseRequestModel.h
//  WeiBo
//
//  Created by tens03 on 16/3/16.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseModel.h"

@interface LWBaseRequestModel : LWBaseModel

/**
 *  把当前对象转换成Data
 */
-(NSData *)conversionData;


/**
 *  把当前对象转换成字典
 */
-(NSDictionary *)conversionDictionary;

@end
