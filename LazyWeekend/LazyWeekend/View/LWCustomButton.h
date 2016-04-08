//
//  LWCustomButton.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWCustomButton : UIButton


@property (nonatomic, strong) UILabel *textlable;
// 创建按钮
+ (instancetype) createCustomButton:(NSString *)labelText withFram:(CGRect) rect;

@end
