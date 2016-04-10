//
//  LWHomeDetailDataSourceViewController.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/10.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseViewController.h"
@class LWHomeDataSourceResponseModel;

@interface LWHomeDetailDataSourceViewController : LWBaseViewController


/**
 *  本页 数据模型
 */
@property (nonatomic, strong) LWHomeDataSourceResponseModel *model;

@end
