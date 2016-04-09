
//
//  LWBaseViewCell.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/9.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseViewCell.h"

@implementation LWBaseViewCell



// 添加子视图
- (void) addSubviews
{
    [self.contentView addSubview:self.bigImage];
}

// 赋值
- (void) Valuation
{
    [self.bigImage sd_setImageWithURL:[NSURL URLWithString:self.model.front_cover_image_list[0]]];
}

// 自动布局
- (void) autoLayout
{
    [self.bigImage mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.contentView);
        make.height.equalTo(@230);
    }];
}


- (void)setModel:(LWHomeResponseModel *)model
{
    _model = model;
    [self addSubviews];
    [self Valuation];
    [self autoLayout];
}


#pragma life Cyc
- (UIImageView *)bigImage
{
    if(!_bigImage)
    {
        _bigImage = [[UIImageView alloc] init];
    }
    return _bigImage;
}

@end
