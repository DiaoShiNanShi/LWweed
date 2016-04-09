//
//  LWBaseViewCell.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/9.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWHomeResponseModel.h"

@interface LWBaseViewCell : UITableViewCell


@property (nonatomic, strong) UIImageView *bigImage;

@property (nonatomic, strong) LWHomeResponseModel *model;



// 添加子视图
- (void) addSubviews;

// 赋值
- (void) Valuation;

// 自动布局
- (void) autoLayout;

@end
