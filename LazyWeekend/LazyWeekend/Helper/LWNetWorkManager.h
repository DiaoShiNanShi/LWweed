//
//  WBNetWorkManager.h
//  WeiBo
//
//  Created by tens03 on 16/3/18.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "WBHomeTimeLineRequest.h"
#import "LWBaseRequestModel.h"


typedef void(^completionHandler)(id result,NSError *error);

// 请求数据枚举类
typedef NS_ENUM(NSInteger, LWDataType) {
    // 首页
    DataTypeHome = 0,
    // 详细
    DataTypeDetail,
    // 数据
    DataTypeDataSource,
    // 搜索数据
    DataTypeSearchSource
    
};

@interface LWNetWorkManager : NSObject


/**
 *  创建单例
 */
+(instancetype) sharNetWorkManager;

/**
 *  网络请求/GET/POST
 *
 *  @param model             请求Model
 *  @param dataType          请求数据类型
 *  @param completionHandler 请求回调
 *  @param requestWay        请求类型
 */

-(void)networkRequestsWithModel:(LWBaseRequestModel *)model withDataType:(LWDataType)dataType withCompletionHandler:(completionHandler)completionHandler withRequestWay:(NSString *)requestWay;


@end
