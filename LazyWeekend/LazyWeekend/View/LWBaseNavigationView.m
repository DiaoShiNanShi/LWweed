//
//  LWBaseNavigationView.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseNavigationView.h"

@interface LWBaseNavigationView()


@end

@implementation LWBaseNavigationView

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        [self addSubviews];
        [self _sizeTofit];
        [self autoLayout];
    }
    return self;
}


#pragma mark - Private
- (void)addSubviews
{
    
}

- (void)_sizeTofit
{
    [self.centerLabelTitle sizeToFit];
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
    
    [self.centerLabelTitle mas_updateConstraints:^(MASConstraintMaker *make) {
       
        
        make.left.equalTo(self.leftButton.mas_right);
        make.right.equalTo(self.rightButton.mas_left);
        make.top.equalTo(self).offset(13);
        make.height.equalTo(@18);
    }];
    
}


#pragma mark - Life Cyc
- (UIButton *)leftButton
{
    if(!_leftButton)
    {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _leftButton;
}

- (UIImageView *)leftImageView
{
    if(!_leftImageView)
    {
        _leftImageView = [[UIImageView alloc] init];
    }
    return _leftImageView;
}
- (UILabel *)centerLabelTitle
{
    if(!_centerLabelTitle)
    {
        _centerLabelTitle = [[UILabel alloc] init];
        _centerLabelTitle.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:16];
        _centerLabelTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _centerLabelTitle;
}
- (UIButton *)rightButton
{
    if(!_rightButton)
    {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _rightButton;
}
- (UIImageView *)rightImageView
{
    if(!_rightImageView)
    {
        _rightImageView = [[UIImageView alloc] init];
    }
    return _rightImageView;
}


@end
