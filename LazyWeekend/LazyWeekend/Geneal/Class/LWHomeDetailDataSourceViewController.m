//
//  LWHomeDetailDataSourceViewController.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/10.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWHomeDetailDataSourceViewController.h"
#import "LWHomeDataSourceResponseModel.h"


@interface LWHomeDetailDataSourceViewController()
<SDCycleScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>


#pragma mark - Member
// 头部滚动视图
@property (nonatomic, strong) SDCycleScrollView *titleScrollView;

@property (nonatomic, strong) UILabel *probablyInformationViewTitleLabel;

// 中上部分 大概信息  高度需要计算  -- title文本长度不一
@property (nonatomic, strong) UIView *probablyInformationView;

// 价格信息 包括聚会  和 价格
@property (nonatomic, strong) UIView *probablyInformationViewPriceView;
@property (nonatomic, strong) UIImageView *probablyInformationViewPriceViewIcon;
@property (nonatomic, strong) UILabel *probablyInformationViewPriceViewTitle;
@property (nonatomic, strong) UILabel *probablyInformationViewPriceViewPrice;


// 日期视图  包括 日期Label
@property (nonatomic, strong) UIView *probablyInformationViewDateView;
@property (nonatomic, strong) UILabel *probablyInformationViewDateViewLabel;

// 地址 按钮
@property (nonatomic, strong) UIButton *probablyInformationViewAddressButton;

// 活动详情View
@property (nonatomic, strong) UIView *aboutDetailView;
@property (nonatomic, strong) UIImageView *leftLine;
@property (nonatomic, strong) UIImageView *leftPoint;
@property (nonatomic, strong) UILabel *centerLabel;
@property (nonatomic, strong) UIImageView *rightLine;
@property (nonatomic, strong) UIImageView *rightPoint;

// 详细数据 -- 包括图片  和 文字详情 用table 实现
@property (nonatomic, strong) UITableView *contenDataTableView;

// 预定须知
@property (nonatomic, strong) UIView *reservationsView;

// 退订规则
@property (nonatomic, strong) UIView *unsubscribeView;

// 懒人提示
@property (nonatomic, strong) UIView *promptView;

#pragma mark - Private
/**
 *  添加子视图
 */
- (void) addSubviews;

/**
 *  赋值
 */
- (void) voluation;

/**
 *  根据字数自动设置宽
 */
- (void) sizeToFit;


/**
 *  自动布局
 */
- (void) autoLayout;

@end

@implementation LWHomeDetailDataSourceViewController




- (void)addSubviews
{

    // 滚动视图
    [self.view addSubview:self.titleScrollView];
    
    
    // 上部分视图 高度需要运算  根据title 部分 字的数量决定
    [self.view addSubview:self.probablyInformationView];
    // 添加title 部分
    [self.probablyInformationView addSubview:self.probablyInformationViewTitleLabel];
    
    // 添加价格部分
    [self.probablyInformationView addSubview:self.probablyInformationViewPriceView];
    [self.probablyInformationViewPriceView addSubview:self.probablyInformationViewPriceViewIcon];
    [self.probablyInformationViewPriceView addSubview:self.probablyInformationViewPriceViewTitle];
    [self.probablyInformationViewPriceView addSubview:self.probablyInformationViewPriceViewPrice];
    
    
    // 添加日期部分
    [self.probablyInformationView addSubview:self.probablyInformationViewDateView];
    [self.probablyInformationViewDateView addSubview:self.probablyInformationViewDateViewLabel];
    
    // 添加地址部分
    [self.probablyInformationView addSubview:self.probablyInformationViewAddressButton];
    
    
    // 添加活动详情部分
    [self.view addSubview:self.aboutDetailView];
    [self.aboutDetailView addSubview:self.leftLine];
    [self.aboutDetailView addSubview:self.leftPoint];
    [self.aboutDetailView addSubview:self.centerLabel];
    [self.aboutDetailView addSubview:self.rightPoint];
    [self.aboutDetailView addSubview:self.rightLine];
    
    
    // 添加数据详情部分
    [self.view addSubview:self.contenDataTableView];
    
    // 添加 预知  退订   提示 部分
    [self.view addSubview:self.reservationsView];
    [self.view addSubview:self.unsubscribeView];
    [self.view addSubview:self.promptView];
    
}

- (void)voluation
{
    
    
}

- (void)sizeToFit
{
    [self.probablyInformationViewPriceViewPrice sizeToFit];
}

- (void)autoLayout
{
    
    // 高：300
    [self.titleScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.width.equalTo(self.view);
        make.height.equalTo(@(300));
        make.left.top.equalTo(self.view);
        
    }];
    
    // 高不确定  需要运算title的高
    [self.probablyInformationView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view);
        make.top.equalTo(self.titleScrollView.mas_bottom);
        make.width.equalTo(self.view);
        make.height.equalTo(@(184 + self.model.titleHeight));
    }];
    
    // 10 + 本身高 + 15
    [self.probablyInformationViewTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.probablyInformationView).offset(15);
        make.right.equalTo(self.probablyInformationView).offset(-15);
        make.top.equalTo(@10);
        make.height.equalTo(@(self.model.titleHeight));
    }];
    
    // 价格部分 50
    [self.probablyInformationViewPriceView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.probablyInformationView);
        make.top.equalTo(self.probablyInformationViewTitleLabel.mas_bottom).offset(15);
        make.height.equalTo(@50);
    }];
    
    [self.probablyInformationViewPriceViewIcon mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(@16);
        make.top.equalTo(@14);
        make.width.height.equalTo(@24);
    }];
    
    [self.probablyInformationViewPriceViewTitle mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.probablyInformationViewPriceViewIcon.mas_right).offset(8);
        make.top.equalTo(@15);
        make.width.equalTo(@32);
        make.height.equalTo(@23);
    }];
    
    [self.probablyInformationViewPriceViewPrice mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.height.equalTo(@24);
        make.top.left.equalTo(@15);
    }];
    
    // 日期部分 高 15 + 44.5
    [self.probablyInformationViewDateView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.probablyInformationViewPriceView.mas_bottom).offset(15);
        make.left.right.equalTo(self.probablyInformationView);
        make.height.equalTo(@44.5);
    }];
    
    [self.probablyInformationViewDateViewLabel mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(@12);
        make.right.equalTo(@(-12));
        make.top.equalTo(@13);
        make.height.equalTo(@19.5);
    }];
    
    // 地址部分 高 49.5
    [self.probablyInformationViewAddressButton mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.equalTo(self.probablyInformationView);
        make.top.equalTo(self.probablyInformationViewDateView.mas_bottom);
        make.height.equalTo(@49.5);
    }];
    
    // 活动详情部分 高 35
    [self.aboutDetailView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.probablyInformationViewAddressButton.mas_bottom).offset(25);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@35);
        
    }];
    [self.leftLine mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(@60.5);
        make.top.equalTo(@21.75);
        make.width.equalTo(@55);
        make.height.equalTo(@0.5);
    }];
    
    [self.leftPoint mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.leftLine.mas_right).offset(4.5);
        make.top.equalTo(@21.75);
        make.width.height.equalTo(@2.5);
        
    }];
    
    [self.centerLabel mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.leftPoint.mas_right).offset(5.5);
        make.top.equalTo(@10);
        make.width.equalTo(@64);
        make.height.equalTo(@22.5);
    }];
    
    [self.rightPoint mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.centerLabel.mas_right).offset(5.5);
        make.top.equalTo(@21.75);
        make.width.height.equalTo(self.leftPoint);
    }];
    
    [self.rightLine mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.rightPoint.mas_right).offset(4.5);
        make.top.equalTo(@21.75);
        make.width.height.equalTo(self.leftLine);
    }];
    
    
    
}


#pragma mark - <UITableViewdelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


#pragma mark - Life Cyc
- (SDCycleScrollView *)titleScrollView
{
    if(!_titleScrollView)
    {
        _titleScrollView = [[SDCycleScrollView alloc] init];
        _titleScrollView.placeholderImage = nil;
        
        _titleScrollView.delegate = self;
    }
    return _titleScrollView;
}

- (UILabel *)probablyInformationViewTitleLabel
{
    if(!_probablyInformationViewTitleLabel)
    {
        _probablyInformationViewTitleLabel = [[UILabel alloc] init];
        _probablyInformationViewTitleLabel.font = [UIFont systemFontOfSize:18];
        _probablyInformationViewTitleLabel.numberOfLines = 0;
    }
    return _probablyInformationViewTitleLabel;
}

- (UIView *)probablyInformationView
{
    if(!_probablyInformationView)
    {
        _probablyInformationView = [[UIView alloc] init];
    }
    return _probablyInformationView;
}

- (UIView *)probablyInformationViewPriceView
{
    if(!_probablyInformationViewPriceView)
    {
        _probablyInformationViewPriceView = [[UIView alloc] init];
    }
    return _probablyInformationViewPriceView;
}

- (UIImageView *)probablyInformationViewPriceViewIcon
{
    if(!_probablyInformationViewPriceViewIcon)
    {
        _probablyInformationViewPriceViewIcon = [[UIImageView alloc] init];
    }
    return _probablyInformationViewPriceViewIcon;
}

- (UILabel *)probablyInformationViewPriceViewTitle
{
    if(!_probablyInformationViewPriceViewTitle)
    {
        _probablyInformationViewPriceViewTitle = [[UILabel alloc] init];
        _probablyInformationViewPriceViewTitle.font = [UIFont systemFontOfSize:16];
    }
    return _probablyInformationViewPriceViewTitle;
}

- (UILabel *)probablyInformationViewPriceViewPrice
{
    if(!_probablyInformationViewPriceViewPrice)
    {
        _probablyInformationViewPriceViewPrice = [[UILabel alloc] init];
        _probablyInformationViewPriceViewPrice.font = [UIFont systemFontOfSize:24];
    }
    return _probablyInformationViewPriceViewPrice;
}

- (UIView *)probablyInformationViewDateView
{
    if(!_probablyInformationViewDateView)
    {
        _probablyInformationViewDateView = [[UIView alloc] init];
    }
    return _probablyInformationViewDateView;
}
- (UILabel *)probablyInformationViewDateViewLabel
{
    if(!_probablyInformationViewDateViewLabel)
    {
        _probablyInformationViewDateViewLabel = [[UILabel alloc] init];
        _probablyInformationViewDateViewLabel.font = [UIFont systemFontOfSize:14];
        
    }
    return _probablyInformationViewDateViewLabel;
}

-(UIButton *)probablyInformationViewAddressButton
{
    if(!_probablyInformationViewAddressButton)
    {
        _probablyInformationViewAddressButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _probablyInformationViewAddressButton;
}

- (UIView *)aboutDetailView
{
    if(!_aboutDetailView)
    {
        _aboutDetailView = [[UIView alloc] init];
    }
    return _aboutDetailView;
}

- (UIImageView *)leftLine
{
    if(!_leftLine)
    {
        _leftLine = [[UIImageView alloc] init];
    }
    return _leftLine;
}
- (UIImageView *)leftPoint
{
    if(!_leftPoint)
    {
        _leftPoint = [[UIImageView alloc] init];
    }
    return _leftPoint;
}
- (UILabel *)centerLabel
{
    if(!_centerLabel)
    {
        _centerLabel = [[UILabel alloc] init];
        _centerLabel.font = [UIFont systemFontOfSize:16];
    }
    return _centerLabel;
}
- (UIImageView *)rightLine
{
    if(!_rightLine)
    {
        _rightLine = [[UIImageView alloc] init];
    }
    return _rightLine;
}

- (UIImageView *)rightPoint
{
    if(!_rightPoint)
    {
        _rightPoint = [[UIImageView alloc] init];
    }
    return _rightPoint;
}
- (UITableView *)contenDataTableView
{
    if(!_contenDataTableView)
    {
        _contenDataTableView = [[UITableView alloc] init];
        _contenDataTableView.delegate = self;
        _contenDataTableView.dataSource = self;
    }
    return _contenDataTableView;
}
- (UIView *)reservationsView
{
    if(!_reservationsView)
    {
        _reservationsView = [[UIView alloc] init];
    }
    return _reservationsView;
}

- (UIView *)unsubscribeView
{
    if(!_unsubscribeView)
    {
        _unsubscribeView = [[UIView alloc] init];
    }
    return _unsubscribeView;
}

- (UIView *)promptView
{
    if(!_promptView)
    {
        _promptView = [[UIView alloc] init];
    }
    return _promptView;
}

@end
