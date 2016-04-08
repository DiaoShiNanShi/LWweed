//
//  LWHomeTableViewCell.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWHomeTableViewCell.h"

@interface LWHomeTableViewCell()

@property (nonatomic, strong) UIImageView *bigImage;
@property (nonatomic, strong) UILabel     *titleLabel;

// 内容
@property (nonatomic, strong) UIView      *_contenView;
@property (nonatomic, strong) UILabel     *_contenViewTitleLabel;

// 时间
@property (nonatomic, strong) UIView      *_contenViewTime;
@property (nonatomic, strong) UILabel      *_contenViewTimeLabel;
// 收藏
@property (nonatomic, strong) UIView      *_contenViewCollection;
@property (nonatomic, strong) UIImageView *_contenViewCollectionIcon;
@property (nonatomic, strong) UILabel     *_contenViewCollectionTextLabel;

// 价格
@property (nonatomic, strong) UIView      *_contenViewPrice;
@property (nonatomic, strong) UILabel     *_contenViewPriceTextLabel;



// 添加子视图
- (void) addSubviews;


// 自动布局
- (void) autoLayout;
@end

@implementation LWHomeTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        
        [self addSubviews];
        [self autoLayout];
    }
    return self;
}


#pragma mark - Privte
- (void)addSubviews
{
    [self.contentView addSubview:self.bigImage];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self._contenView];
    
    
    // 添加_conTenView 子视图
    [self._contenView addSubview:self._contenViewTitleLabel];
    
    // 添加时间
    [self._contenView addSubview:self._contenViewTime];
    [self._contenViewTime addSubview:self._contenViewTimeLabel];
    
    // 添加收藏
    [self._contenView addSubview:self._contenViewCollection];
    [self._contenViewCollection addSubview:self._contenViewCollectionIcon];
    [self._contenViewCollection addSubview:self._contenViewCollectionTextLabel];
    
    // 添加价格
    [self._contenView addSubview:self._contenViewPrice];
    [self._contenViewPrice addSubview:self._contenViewPriceTextLabel];
    
}

- (void)autoLayout
{
    
    [self.bigImage mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.contentView);
        make.height.equalTo(@230);
    }];
    
}

@end
