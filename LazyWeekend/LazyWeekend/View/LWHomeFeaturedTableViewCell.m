//
//  LWHomeFeaturedTableViewCell.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWHomeFeaturedTableViewCell.h"

@implementation LWHomeFeaturedTableViewCell




// 添加子视图
- (void) addSubviews
{
    [super addSubviews];
    [self.contentView addSubview:self.bigImage];
    [self.contentView addSubview:self.labelView];
    [self.labelView addSubview:self.labeltext];
    [self.contentView addSubview:self.labelTitle];
}

// 赋值
- (void) Valuation
{
    [super Valuation];
    self.labeltext.text = @"精选";
    self.labelTitle.text = self.model.title;
}

// 自动布局
- (void) autoLayout
{
    [super autoLayout];
    [self.labelView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.bigImage.mas_bottom).offset(13);
        make.left.equalTo(self.contentView).offset(15);
        make.width.equalTo(@42);
        make.height.equalTo(@21);
        
    }];
    
    [self.labeltext mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.labelView);
    }];
    
    [self.labelTitle mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.height.equalTo(self.labelView);
        make.top.equalTo(self.bigImage.mas_bottom).offset(13);
        make.left.equalTo(self.labelView.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-15);
        
    }];
    
}


- (void)setModel:(LWHomeResponseModel *)model
{
    [super setModel:model];
    
    [self addSubviews];
    [self Valuation];
    [self autoLayout];
}

#pragma life Cyc

- (UIView *)labelView
{
    if(!_labelView)
    {
        _labelView = [[UIView alloc] init];
        _labelView.layer.cornerRadius = 3;
        _labelView.layer.borderWidth = 1;
        _labelView.layer.borderColor = [UIColor colorWithR:166 g:170 b:177 alpha:1].CGColor;
    }
    return _labelView;
}

- (UILabel *)labeltext
{
    if(!_labeltext)
    {
        _labeltext = [[UILabel alloc] init];
        _labeltext.textColor = [UIColor colorWithR:166 g:170 b:177 alpha:1];
        _labeltext.font = [UIFont systemFontOfSize:12];
        _labeltext.textAlignment = NSTextAlignmentCenter;
    }
    return _labeltext;
}

- (UILabel *)labelTitle
{
    if(!_labelTitle)
    {
        _labelTitle = [[UILabel alloc] init];
        _labelTitle.font = [UIFont systemFontOfSize:15];
        _labelTitle.textColor = [UIColor colorWithR:62 g:66 b:76 alpha:1];
    }
    return _labelTitle;
}

@end
