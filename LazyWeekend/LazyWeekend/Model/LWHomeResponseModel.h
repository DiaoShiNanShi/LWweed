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
@property (nonatomic, copy) NSNumber *price;


/**
 *  收藏数
 */
@property (nonatomic, copy) NSNumber *collected_num;

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

@end
