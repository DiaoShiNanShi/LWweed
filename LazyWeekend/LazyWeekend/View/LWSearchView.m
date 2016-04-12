//
//  LWSearchView.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWSearchView.h"


@interface LWSearchView()

@property (nonatomic, strong) UIView *searceAddressView;
@property (nonatomic, strong) UILabel *searceLabel;
@property (nonatomic, strong) UIImageView *searceIcon;


// 搜索框
@property (nonatomic, strong) UISearchBar *searceBar;

// 内容
@property (nonatomic, strong) UIView *contentView;


#pragma mark - Function
- (void) addSubviews;

- (void) voluation;

- (void) _sizeToFit;

- (void) autoLayout;

@end


@implementation LWSearchView


- (instancetype)init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}


#pragma mark Prevate Function
- (void) addSubviews
{
    // 地址部分
    [self addSubview:self.searceAddressView];
    [self.searceAddressView addSubview:self.searceIcon];
    [self.searceAddressView addSubview:self.searceLabel];
    
    // 搜索框部分
    [self addSubview:self.searceBar];
    
    // 内容部分
    [self addSubview:self.contentView];
}

- (void) voluation
{
    
}

- (void) _sizeToFit
{
    
}

- (void) autoLayout
{
    
}

#pragma mark - Life Cyc

- (UIView *)searceAddressView
{
    if(!_searceAddressView)
    {
        _searceAddressView = [[UIView alloc] init];
    }
    return _searceAddressView;
}

- (UIImageView *)searceIcon
{
    if(!_searceIcon)
    {
        _searceIcon = [[UIImageView alloc] init];
    }
    return _searceIcon;
}

@end
