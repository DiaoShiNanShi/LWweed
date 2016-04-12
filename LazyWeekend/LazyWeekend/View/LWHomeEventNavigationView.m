//
//  LWHomeEventNavigationView.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWHomeEventNavigationView.h"

@interface LWHomeEventNavigationView()


@end

@implementation LWHomeEventNavigationView

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.leftImageView.image = [UIImage imageNamed:@"ic_nav_left"];
        self.rightImageView.image = [UIImage imageNamed:@"ic_nav_share_black"];
    }
    return self;
}

- (void)addSubviews
{
    [super addSubviews];
    [self addSubview:self.leftButton];
    [self.leftButton addSubview:self.leftImageView];
    [self addSubview:self.centerLabelTitle];
    [self addSubview:self.rightButton];
    [self.rightButton addSubview:self.rightImageView];
}

- (void)_sizeTofit
{
    [super _sizeTofit];
}

- (void)autoLayout
{
    [super autoLayout];
}


@end
