//
//  LWBaseNavigationView.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWBaseNavigationView : UIView


// 共同属性
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIImageView *leftImageView;

@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIImageView *rightImageView;

@property (nonatomic, strong) UILabel     *centerLabelTitle;


// 加子视图
- (void) addSubviews;

// 自动改变宽度
- (void) _sizeTofit;

// 自动布局
- (void) autoLayout;
@end
