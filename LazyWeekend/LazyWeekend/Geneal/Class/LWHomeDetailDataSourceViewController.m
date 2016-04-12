//
//  LWHomeDetailDataSourceViewController.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/10.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWHomeDetailDataSourceViewController.h"
#import "LWHomeDataSourceResponseModel.h"



#import "LWBaseDataSourceViewCell.h"
#import "LWHomeDataSourcePictureTableViewCell.h"
#import "LWHomeDataSourceTextTableViewCell.h"
#import "LWHomeDataSourceNavigationView.h"

@interface LWHomeDetailDataSourceViewController()
<SDCycleScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) LWHomeDataSourceNavigationView *navigationBarView;

#pragma mark - Member
@property (nonatomic, strong) UIScrollView *outLayerScrollView;

// 头部滚动视图
@property (nonatomic, strong) SDCycleScrollView *titleScrollView;

// 中上部分 大概信息  高度需要计算  -- title文本长度不一
@property (nonatomic, strong) UIView *probablyInformationView;
@property (nonatomic, strong) UILabel *probablyInformationViewTitleLabel;

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

/**
 *  计算文字的高度
 *
 *  @param text 需要计算的文字
 *
 *  @return 返回的高度
 */
- (CGFloat) computeText:(NSString *)text;
@end

@implementation LWHomeDetailDataSourceViewController

- (void)viewDidLoad
{
    
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.userInteractionEnabled = NO;
    
    
    [super viewDidLoad];
    // 注册CELL
    
    [self.contenDataTableView registerClass:[LWHomeDataSourcePictureTableViewCell class] forCellReuseIdentifier:kLWHomeDataSourcePictureTableViewCell];
    [self.contenDataTableView registerClass:[LWHomeDataSourceTextTableViewCell class] forCellReuseIdentifier:kLWHomeDataSourceTextTableViewCell];
    [self addSubviews];
    [self voluation];
    [self sizeToFit];
    [self autoLayout];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view bringSubviewToFront:self.navigationBarView];
}

- (void)addSubviews
{
    
    [self.view addSubview:self.navigationBarView];
    [self.view addSubview:self.outLayerScrollView];
    // 滚动视图
    [self.outLayerScrollView addSubview:self.titleScrollView];
    
    // 上部分视图 高度需要运算  根据title 部分 字的数量决定
    [self.outLayerScrollView addSubview:self.probablyInformationView];
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
    [self.outLayerScrollView addSubview:self.aboutDetailView];
    [self.aboutDetailView addSubview:self.leftLine];
    [self.aboutDetailView addSubview:self.leftPoint];
    [self.aboutDetailView addSubview:self.centerLabel];
    [self.aboutDetailView addSubview:self.rightPoint];
    [self.aboutDetailView addSubview:self.rightLine];
    
    // 添加 预知  退订   提示 部分
    // [self.outLayerScrollView addSubview:self.reservationsView];
    // [self.outLayerScrollView addSubview:self.unsubscribeView];
    // [self.outLayerScrollView addSubview:self.promptView];
    
    // 添加数据详情部分
    [self.outLayerScrollView addSubview:self.contenDataTableView];
    
}

// 赋值操作
- (void)voluation
{
    self.titleScrollView.imageURLStringsGroup = self.model.images;
    self.probablyInformationViewTitleLabel.text = self.model.title;
    
    [self.probablyInformationViewPriceViewIcon sd_setImageWithURL:[NSURL URLWithString:self.model.category_icon]];
    self.probablyInformationViewPriceViewTitle.text = self.model.category_name;
    self.probablyInformationViewPriceViewPrice.text = self.model.price_info;
    self.probablyInformationViewDateViewLabel.text = self.model.time;
    [self.probablyInformationViewAddressButton setTitle:self.model.address forState:UIControlStateNormal];
    
}

- (void)sizeToFit
{
    [self.probablyInformationViewPriceViewPrice sizeToFit];
    [self.probablyInformationViewPriceViewTitle sizeToFit];
}

- (void)autoLayout
{
    
    [self.navigationBarView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(@20);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@44);
    }];
    
    // 高：300
    [self.titleScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.width.equalTo(self.outLayerScrollView);
        make.height.equalTo(@(300));
        make.left.top.equalTo(self.outLayerScrollView);
        
    }];
    
    // 高不确定  需要运算title的高
    [self.probablyInformationView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.outLayerScrollView);
        make.top.equalTo(self.titleScrollView.mas_bottom);
        make.width.equalTo(self.outLayerScrollView);
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
        // make.width.equalTo(@32);
        make.height.equalTo(@23);
    }];
    
    [self.probablyInformationViewPriceViewPrice mas_updateConstraints:^(MASConstraintMaker *make) {
       
        
        make.height.equalTo(@24);
        make.top.equalTo(@15);
        make.right.equalTo(@(-15));
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
       
        make.top.equalTo(self.probablyInformationView.mas_bottom).offset(25);
        make.height.equalTo(@35);
        make.leading.equalTo(self.outLayerScrollView.mas_leading);
        make.width.equalTo(self.outLayerScrollView.mas_width);
        
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

    
    // 详细数据部分 table
    [self.contenDataTableView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.aboutDetailView.mas_bottom).offset(25);
        
        make.left.equalTo(self.outLayerScrollView);
        make.width.equalTo(self.outLayerScrollView);
        //NSLog(@"table:  %f - %f",self.model.dataPictureHeight,self.model.dataTextHeight);
        
        make.height.equalTo(@(self.model.dataPictureHeight + self.model.dataTextHeight));
    }];
    
    
}


#pragma mark - <UITableViewdelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.descriptionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LWBaseDataSourceViewCell *baseCell;
    
    if ([(self.model.descriptionArray[indexPath.row][@"type"]) isEqualToString:@"text"]) {
        
        baseCell = [tableView dequeueReusableCellWithIdentifier:kLWHomeDataSourceTextTableViewCell forIndexPath:indexPath];
        baseCell.contentText = self.model.descriptionArray[indexPath.row][@"content"];
        
    }else
    {
        baseCell = [tableView dequeueReusableCellWithIdentifier:kLWHomeDataSourcePictureTableViewCell forIndexPath:indexPath];
        [baseCell.picture sd_setImageWithURL:[NSURL URLWithString:self.model.descriptionArray[indexPath.row][@"content"]]];
    }
    
    return baseCell;
}
// 返回CELL 的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([(self.model.descriptionArray[indexPath.row][@"type"]) isEqualToString:@"text"]) {
        CGSize totalSize = CGSizeMake(kScreenWidth-15*2, 1000);
        NSString *text = self.model.descriptionArray[indexPath.row][@"content"];
        text = [text stringByReplacingOccurrencesOfString:@"\r\n" withString:@"\n"];
        
        
        CGFloat height = [text calcTextSizeWith:[UIFont fontWithName:@"FZLTXHK--GBK1-0" size:13] totalSize:totalSize].height;
        return ceil(height)+10;
    }else
    {
        return 200;
    }
}


#pragma mark - Private
- (CGFloat) computeText:(NSString *)text
{
    CGSize totalSize = CGSizeMake(kScreenWidth-15*2, 1000);
    CGFloat textheight = ceil([text calcTextSizeWith:[UIFont systemFontOfSize:13] totalSize:totalSize].height);
    
    return textheight;
}

#pragma mark - Life Cyc

- (UIScrollView *)outLayerScrollView
{
    if(!_outLayerScrollView)
    {
        _outLayerScrollView = [[UIScrollView alloc] init];
        _outLayerScrollView.frame = self.view.bounds;
        
        // 滚动高度需要运算
        // _outLayerScrollView.contentSize = CGSizeMake(kScreenWidth, 300 + 184 + self.model.titleHeight + 35 + self.model.dataTextHeight + self.model.dataPictureHeight);
        
        _outLayerScrollView.contentSize = CGSizeMake(kScreenWidth, 300 + 184 + self.model.titleHeight + 35 + self.model.dataTextHeight + self.model.dataPictureHeight + 50);
    }
    return _outLayerScrollView;
}

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
        _probablyInformationViewTitleLabel.numberOfLines = 0;
        _probablyInformationViewTitleLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:18];
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
        _probablyInformationViewPriceViewTitle.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:16];
    }
    return _probablyInformationViewPriceViewTitle;
}

- (UILabel *)probablyInformationViewPriceViewPrice
{
    if(!_probablyInformationViewPriceViewPrice)
    {
        _probablyInformationViewPriceViewPrice = [[UILabel alloc] init];
        _probablyInformationViewPriceViewPrice.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:24];
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
        _probablyInformationViewDateViewLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:14];
        
    }
    return _probablyInformationViewDateViewLabel;
}

-(UIButton *)probablyInformationViewAddressButton
{
    if(!_probablyInformationViewAddressButton)
    {
        _probablyInformationViewAddressButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _probablyInformationViewAddressButton.titleLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:14];
        
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
        _centerLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:16];
        _centerLabel.text = @"活动详情";
        _centerLabel.textAlignment = NSTextAlignmentCenter;
        
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
        _contenDataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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

- (LWHomeDataSourceNavigationView *)navigationBarView{
    if(!_navigationBarView)
    {
        _navigationBarView = [[LWHomeDataSourceNavigationView alloc] init];
        _navigationBarView.backgroundColor = [UIColor clearColor];
        
        // 添加点击事件
        [_navigationBarView.leftButton addTarget:self action:@selector(comeBlack) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _navigationBarView;
}


- (void) comeBlack
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:([self.navigationController.viewControllers count] -2)] animated:YES];
}

@end
