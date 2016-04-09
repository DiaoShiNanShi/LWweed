//
//  LWHomeViewController.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWHomeViewController.h"
#import "LWMenuScrollVlew.h"
#import "LWContenScrollView.h"
#import "LWNetWorkManager.h"
#import "LWHomeRequestModel.h"
#import "LWHomeResponseModel.h"
#import "LWHomeFeaturedTableViewCell.h"
#import "LWBaseViewCell.h"

#import "LWHomeRecommendViewCell.h"
#import "LWHomeFeaturedTableViewCell.h"
#import "LWHomeResponseModel.h"

#import "UIColor+TBAddition.h"
#import "UINavigationController+TBAddition.h"


#import "LWMenuViewController.h"


static int leftIndex = 0;
//static int rightIndex = 0;

@interface LWHomeViewController ()
<UITableViewDelegate,UITableViewDataSource>

// 菜单ScrollView
@property (nonatomic, strong) LWMenuScrollVlew *UIMenuScrollView;
@property (nonatomic, strong) LWContenScrollView *contenScrollView;

// 主页TableView
@property (nonatomic, strong) UITableView *tableView;


// 主页数据
@property (nonatomic, strong) NSMutableArray *dataArray;

/**
 *  设置Navigation左右 按钮
 */
- (void) setNavigationItemLeftAndRightButton;

/**
 *  左边按钮点击事件
 */
- (void) customleftBarButtonItemOnClick;

/**
 *  右边按钮点击事件
 */
- (void) customRightBarButtonItemOnClick;

/**
 *  打开菜单
 */
- (void) openOrCloseMenu;

/**
 *  添加子视图
 */
- (void) addSubViews;

/**
 *  自动布局
 */
- (void) autoLayout;

/**
 *  下载数据
 */
- (void) downLoadDataArray;

@end

@implementation LWHomeViewController


// 视图将要加载出来
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self downLoadDataArray];
    [self.tableView registerClass:[LWHomeRecommendViewCell class] forCellReuseIdentifier:kRecommendIdentFiler];
    [self.tableView registerClass:[LWHomeFeaturedTableViewCell class] forCellReuseIdentifier:kFeaturedIdentFiler];
    
    [self setNavigationItemLeftAndRightButton];
    [self addSubViews];
    [self autoLayout];
}


#pragma mark - downLoadDataArray
- (void)downLoadDataArray
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        for (int i = 1; i <= 23; i ++) {
            
            LWHomeRequestModel *requestModel = [[LWHomeRequestModel alloc] init];
            requestModel.city_id = @324;
            requestModel.lat = @3054869;
            requestModel.lon = @104.0637;
            requestModel.page = @(i);
            requestModel.session_id = @"000042fad9cf03470b62485c38db159638d6ad";
            requestModel.v = @3;
            if(i == 1)
            {
                requestModel.city_id = 0;
                requestModel.lat = @30.54871;
                requestModel.lon = @104.0634;
            }
            
            if(i == 2)
            {
                requestModel.lat = @30.54871;
                requestModel.lon = @104.0634;
            }
            
            [[LWNetWorkManager sharNetWorkManager] networkRequestsWithModel:requestModel withDataType:DataTypeHome withCompletionHandler:^(id result, NSError *error) {
                
                if(error)
                {
                    return ;
                }
                
                [self.dataArray addObjectsFromArray:result];
                
                // 回到主线程刷新数据
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
                
            } withRequestWay:kGET];
        }
        
    });
}


#pragma mark - Pravite
- (void)setNavigationItemLeftAndRightButton
{
    UIImage *leftBacImage = [UIImage imageNamed:@"cat_me"];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[leftBacImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(customleftBarButtonItemOnClick)];
    
    UIImage *rightBacImage = [UIImage imageNamed:@"ic_nav_search"];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[rightBacImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(customRightBarButtonItemOnClick)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithR:246 g:247 b:247 alpha:1];
}

- (void)customleftBarButtonItemOnClick
{
    [self openOrCloseMenu];
    
    NSLog(@"%s",__func__);
}

- (void)customRightBarButtonItemOnClick
{
    NSLog(@"%s",__func__);
}

// 打开菜单
- (void)openOrCloseMenu
{
    [self.contenScrollView layoutIfNeeded];
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
        
        [self.contenScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
           
            if(leftIndex % 2 == 0)
            {
                make.bottom.equalTo(self.view).offset(464);
                self.navigationController.navigationBar.top = 488;
                
            }else
            {
                make.bottom.equalTo(self.view);
                self.navigationController.navigationBar.top = 20;
            }
            
        }];
        
        leftIndex ++;
        [self.view layoutIfNeeded];
    } completion:nil];
    
}

#pragma mark - UITableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LWHomeResponseModel *model = self.dataArray[indexPath.row];
    
    LWBaseViewCell *cell;
    
    if ([model.item_type isEqualToString:@"leo"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:kRecommendIdentFiler forIndexPath:indexPath];
        
    }else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:kFeaturedIdentFiler forIndexPath:indexPath];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = model;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LWHomeResponseModel *model = self.dataArray[indexPath.row];
    
    if([model.item_type isEqualToString:@"leo"])
    {
        return model.cellHeight;
    }else
    {
        return 282;
    }
}


// 点击事件进入详细页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



#pragma mark - AutoLayout
- (void)addSubViews
{
    [self.view addSubview:self.contenScrollView];
    [self.view addSubview:self.UIMenuScrollView];
    [self.contenScrollView addSubview:self.tableView];
    
}
- (void)autoLayout
{
    
    [self.contenScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.bottom.left.equalTo(self.view);
        make.height.equalTo(@504);
    }];
    
    
    [self.UIMenuScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view);
        make.width.left.equalTo(self.view);
        make.bottom.equalTo(self.contenScrollView.mas_top);
        
    }];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.width.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
        
    }];
    
    self.contenScrollView.contentSize = CGSizeMake(kScreenWidth, 505 + 1);
    self.UIMenuScrollView.contentSize = CGSizeMake(kScreenWidth, 468 + 1);
}



#pragma mark Life Cycle
- (LWMenuScrollVlew *)UIMenuScrollView
{
    if(!_UIMenuScrollView)
    {
        _UIMenuScrollView = [[LWMenuScrollVlew alloc] init];
        _UIMenuScrollView.backgroundColor = [UIColor blackColor];
        _UIMenuScrollView.bounces = YES;
        _UIMenuScrollView.scrollEnabled = YES;
        
    }
    return _UIMenuScrollView;
}

- (LWContenScrollView *)contenScrollView
{
    if(!_contenScrollView)
    {
        _contenScrollView = [LWContenScrollView createLWContenScrollView];
        _contenScrollView.backgroundColor = [UIColor blueColor];
        _contenScrollView.bounces = YES;
        _contenScrollView.scrollEnabled = YES;
    }
    return _contenScrollView;
}
- (NSMutableArray *)dataArray
{
    if(!_dataArray)
    {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    }
    return _tableView;
}
@end
