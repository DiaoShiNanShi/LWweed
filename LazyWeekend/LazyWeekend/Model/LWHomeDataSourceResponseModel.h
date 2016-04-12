//
//  LWHomeDataSourceResponseModel.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/10.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWBaseResponseModel.h"

@interface LWHomeDataSourceResponseModel : LWBaseResponseModel


/**
 *  头部所有图片 数组类型
 */
@property (nonatomic, strong) NSArray *images;

/**
 *  人数图片 ICON  聚会图片
 */
@property (nonatomic, copy) NSString *category_icon;

/**
 *  聚会名称
 */
@property (nonatomic, copy) NSString *category_name;

// 标题
@property (nonatomic, copy) NSString *title;

/**
 *  单价
 */
@property (nonatomic, copy) NSString *price_info;

/**
 *  活动时间
 */
@property (nonatomic, copy) NSString *time;

/**
 *  地址
 */
@property (nonatomic, copy) NSString *address;

/**
 *  店名
 */
@property (nonatomic, copy) NSString *providers;


// ---------------------- **   活动详情    ** ------------//

// 详细数据 包括 图片  文字
@property (nonatomic, strong) NSArray *descriptionArray;


// ---------------------- **   通用篇      ** -------------//

/**
 *  预定须知
 */
@property (nonatomic, strong) NSArray *booking_policy;

/**
 *  退改规则
 */
@property (nonatomic, strong) NSArray *ticket_rule;

/**
 *  懒人提示  需要新增一条 本活动由谁提供
 */
@property (nonatomic, strong) NSArray *lrzm_tips;


// ---------------- ** 高度计算 ** ---------//

@property (nonatomic, assign) CGFloat titleHeight;


@property (nonatomic, assign) CGFloat dataTextHeight;
@property (nonatomic, assign) CGFloat dataPictureHeight;
@end
