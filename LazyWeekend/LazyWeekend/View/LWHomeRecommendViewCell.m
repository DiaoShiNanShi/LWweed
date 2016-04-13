//
//  LWHomeTableViewCell.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWHomeRecommendViewCell.h"

@interface LWHomeRecommendViewCell()

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


@end

@implementation LWHomeRecommendViewCell



#pragma mark - Privte
- (void)addSubviews
{
    [super addSubviews];
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

// 设置值
- (void)Valuation
{
    [super Valuation];
    self.titleLabel.text = self.model.title;
    
    self._contenViewTitleLabel.text = [NSString stringWithFormat:@"%@ 8k . %@",self.model.poi,self.model.category];
    
    if([self.model.time_info isEqualToString:@""])
    {
        self._contenViewTime.hidden = YES;
    }else
    {
        self._contenViewTimeLabel.text = self.model.time_info;
    }
    self._contenViewCollectionTextLabel.text = self.model.collected_num;
    
    self._contenViewPriceTextLabel.text = [NSString stringWithFormat:@"%@",self.model.price];
    
}

- (void)autoLayout
{
    [super autoLayout];
    
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.bigImage.mas_bottom).offset(6);
        make.left.equalTo(self.contentView).offset(12);
        make.right.equalTo(self.contentView).offset(-12);
        
        make.height.equalTo(@(self.model.titleHeight));
    }];
    
    
    // -----------------** title下面的视图 **---------------//
    
    [self._contenView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.left.right.equalTo(self.titleLabel);
        // make.height.equalTo(@56);
        make.bottom.equalTo(self.contentView).offset(-6);
    }];
    
    [self._contenViewTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.equalTo(self._contenView);
        make.top.equalTo(self._contenView.mas_top).offset(5);
        make.height.equalTo(@17);
    }];
    
    [self._contenViewTime mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self._contenView);
        make.top.equalTo(self._contenViewTitleLabel.mas_bottom).offset(10);
        make.height.equalTo(@21);
        make.width.equalTo(@(self.model.time_info_width + 6));
        
    }];
    
    [self._contenViewTimeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self._contenViewTime);
    }];
    
    [self._contenViewCollection mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self._contenViewTime.mas_right).offset(5);
        make.top.equalTo(self._contenViewTitleLabel.mas_bottom).offset(10);
        make.height.equalTo(@21);
        make.width.equalTo(@(self.model.collected_num_width + 6));
    }];
    
    [self._contenViewCollectionIcon mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self._contenViewCollection).offset(8);
        make.top.equalTo(self._contenViewCollection).offset(3);
        make.width.height.equalTo(@15);
    }];
    
    
    [self._contenViewCollectionTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self._contenViewCollectionIcon.mas_right);
        make.top.equalTo(self._contenViewCollection).offset(3);
    }];
    
    [self._contenViewPrice mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self._contenViewTitleLabel.mas_bottom).offset(10);
        make.height.equalTo(@21);
        make.width.equalTo(@(self.model.pricewidth + 6));
        make.right.equalTo(self).offset(-12);
    }];
    
    [self._contenViewPriceTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self._contenViewPrice);
    }];
    
    
}

// 自动改变大小
- (void)_sizeToFit
{
    [super _sizeToFit];
    [self._contenViewTimeLabel sizeToFit];
    [self._contenViewCollectionTextLabel sizeToFit];
    [self._contenViewPriceTextLabel sizeToFit];
}

#pragma mark - SetModel
- (void)setModel:(LWHomeResponseModel *)model
{
    [super setModel:model];
    [self addSubviews];
    [self Valuation];
    [self _sizeToFit];
    [self autoLayout];
}

#pragma mark - life Cycout
- (UILabel *)titleLabel
{
    if(!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:15];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [UIColor colorWithR:58 g:62 b:72 alpha:1];
    }
    return _titleLabel;
}

- (UIView *)_contenView
{
    if(!__contenView)
    {
        __contenView = [[UIView alloc] init];
    }
    return __contenView;
}

- (UILabel *)_contenViewTitleLabel
{
    if(!__contenViewTitleLabel)
    {
        __contenViewTitleLabel = [[UILabel alloc] init];
        __contenViewTitleLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:12];
        __contenViewTitleLabel.textColor = [UIColor colorWithR:138 g:143 b:153 alpha:1];
    }
    return __contenViewTitleLabel;
}

- (UIView *)_contenViewTime
{
    if(!__contenViewTime)
    {
        __contenViewTime = [[UIView alloc] init];
        __contenViewTime.layer.cornerRadius = 3;
        __contenViewTime.layer.borderColor = [UIColor colorWithR:214 g:214 b:214 alpha:1].CGColor;
        __contenViewTime.layer.borderWidth = 1;
    }
    return __contenViewTime;
}

- (UILabel *)_contenViewTimeLabel
{
    if(!__contenViewTimeLabel)
    {
        __contenViewTimeLabel = [[UILabel alloc] init];
        __contenViewTimeLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:12];
        __contenViewTimeLabel.textAlignment = NSTextAlignmentCenter;
        __contenViewTimeLabel.textColor = [UIColor colorWithR:135 g:141 b:149 alpha:1];
    }
    return __contenViewTimeLabel;
}

- (UIView *)_contenViewCollection{
    if (!__contenViewCollection)
    {
        __contenViewCollection = [[UIView alloc] init];
        __contenViewCollection.layer.cornerRadius = 3;
        __contenViewCollection.layer.borderColor = [UIColor colorWithR:214 g:214 b:214 alpha:1].CGColor;
        __contenViewCollection.layer.borderWidth = 1;
    }
    return __contenViewCollection;
}
- (UIImageView *)_contenViewCollectionIcon{
    if(!__contenViewCollectionIcon)
    {
        __contenViewCollectionIcon = [[UIImageView alloc] init];
        __contenViewCollectionIcon.image = [UIImage imageNamed:@"ic_nav_black_heart_off"];
        
    }
    return __contenViewCollectionIcon;
}

-(UILabel *)_contenViewCollectionTextLabel{
    if(!__contenViewCollectionTextLabel)
    {
        __contenViewCollectionTextLabel = [[UILabel alloc] init];
        __contenViewCollectionTextLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:12];
        __contenViewCollectionTextLabel.textAlignment = NSTextAlignmentCenter;
        __contenViewCollectionTextLabel.textColor = [UIColor colorWithR:135 g:141 b:149 alpha:1];
    }
    return __contenViewCollectionTextLabel;
}
- (UIView *)_contenViewPrice
{
    if(!__contenViewPrice)
    {
        __contenViewPrice = [[UIView alloc] init];
        __contenViewPrice.layer.cornerRadius = 3;
        __contenViewPrice.layer.borderColor = [UIColor colorWithR:214 g:214 b:214 alpha:1].CGColor;
        __contenViewPrice.layer.borderWidth = 1;
    }
    return __contenViewPrice;
}
- (UILabel *)_contenViewPriceTextLabel{
    if(!__contenViewPriceTextLabel)
    {
        __contenViewPriceTextLabel = [[UILabel alloc] init];
        __contenViewPriceTextLabel.textAlignment = NSTextAlignmentCenter;
        __contenViewPriceTextLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:12];
        __contenViewPriceTextLabel.textColor = [UIColor colorWithR:135 g:141 b:149 alpha:1];
    }
    return __contenViewPriceTextLabel;
}

@end
