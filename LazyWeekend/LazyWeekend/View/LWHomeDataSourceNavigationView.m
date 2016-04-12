//
//  LWHomeDataSourceNavigationView.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWHomeDataSourceNavigationView.h"

@implementation LWHomeDataSourceNavigationView


- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.leftImageView.image = [UIImage imageNamed:@"ic_nav_left"];
        // 帮助
        self.rightImageView.image = [UIImage imageNamed:@"ic_nav_help"];
        // 收藏
        self.collectImageView.image = [UIImage imageNamed:@"ic_tip_heart"];
        // 分享
        self.shaImageView.image = [UIImage imageNamed:@"ic_nav_share_black"];
    }
    return self;
}

- (void)addSubviews
{
    [self addSubview:self.leftButton];
    [self.leftButton addSubview:self.leftImageView];
    
    [self addSubview:self.rightButton];
    [self.rightButton addSubview:self.rightImageView];
    
    [self addSubview:self.shaButton];
    [self.shaButton addSubview:self.shaImageView];
    
    [self addSubview:self.collectButton];
    [self.collectButton addSubview:self.collectImageView];
    
}

- (void)autoLayout
{
    [self.leftButton mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(2);
        make.width.height.equalTo(@40);
    }];
    
    
    [self.leftImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(self).offset(7.5);
        make.width.height.equalTo(@25);
    }];
    
    [self.rightButton mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.height.equalTo(self.leftButton);
        make.top.equalTo(self.leftButton.mas_top);
        make.right.equalTo(self).offset(-7.5);
        
    }];
    
    [self.rightImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.height.equalTo(self.leftImageView);
        make.top.equalTo(self.leftImageView.mas_top);
        make.right.equalTo(self).offset(-7.5);
    }];
    
    [self.collectButton mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.width.height.equalTo(self.leftButton);
        make.top.equalTo(self.leftButton.mas_top);
        make.right.equalTo(self.rightButton.mas_left);
    }];
    
    [self.collectImageView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.width.height.equalTo(self.leftImageView);
        make.top.equalTo(self.leftImageView.mas_top);
        make.right.equalTo(self.collectButton.mas_right).offset(-7.5);
    }];
    
    [self.shaButton mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.width.height.equalTo(self.leftButton);
        make.top.equalTo(self.leftButton.mas_top);
        make.right.equalTo(self.collectButton.mas_left);
        
    }];
    
    [self.shaImageView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.width.height.equalTo(self.leftImageView);
        make.top.equalTo(self.leftImageView.mas_top);
        make.right.equalTo(self.shaButton.mas_right).offset(-7.5);
        
    }];
    
    
}

#pragma mark Life Cyc
-(UIButton *)shaButton
{
    if(!_shaButton)
    {
        _shaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _shaButton;
}

- (UIImageView *)shaImageView
{
    if(!_shaImageView)
    {
        _shaImageView = [[UIImageView alloc] init];
    }
    return _shaImageView;
}

- (UIButton *)collectButton
{
    if(!_collectButton)
    {
        _collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _collectButton;
}
- (UIImageView *)collectImageView
{
    if(!_collectImageView)
    {
        _collectImageView = [[UIImageView alloc] init];
    }
    return _collectImageView;
}

@end
