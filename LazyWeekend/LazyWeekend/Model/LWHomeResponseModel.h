//
//  LWHomeResponseModel.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseResponseModel.h"

@interface LWHomeResponseModel : LWBaseResponseModel

/**
 *  地址
 */
@property (nonatomic, copy) NSString *address;


/**
 *  title
 */
@property (nonatomic, copy) NSString *title;


/**
 *  单价
 */
@property (nonatomic, copy) NSString *price;


/**
 *  收藏数
 */
@property (nonatomic, copy) NSString *collected_num;

/**
 *  图片数
 */
@property (nonatomic, strong) NSMutableArray *front_cover_image_list;


/**
 *  店名
 */
@property (nonatomic, copy) NSString *poi_name;

/**
 *  类型
 */
@property (nonatomic, copy) NSString *category;

/**
 *  日期
 */
@property (nonatomic, copy) NSString *time_info;


/**
 *  详细页面ID
 */
@property (nonatomic, copy) NSNumber *leo_id;

/**
 * 本条信息的类型 event 为推荐   leo 为普通类型
 */
@property (nonatomic, copy) NSString *item_type;
// ----------------------*   计算字体宽 高   *---------------//

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGFloat titleHeight;
@property (nonatomic, assign) CGFloat time_info_width;
@property (nonatomic, assign) CGFloat collected_num_width;
@property (nonatomic, assign) CGFloat pricewidth;
@end
