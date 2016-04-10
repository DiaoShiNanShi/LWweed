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
#import "LWHomeDetailEnevtListViewController.h"
#import "LWHomeRecommendViewCell.h"
#import "LWHomeFeaturedTableViewCell.h"
#import "LWHomeResponseModel.h"

#import "UIColor+TBAddition.h"
#import "UINavigationController+TBAddition.h"


#import "LWMenuViewController.h"
#import "MJRefresh.h"
#import "MJChiBaoZiFooter.h"


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


static int ReloadPage = 1;
@implementation LWHomeViewController


// 视图将要加载出来
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self downLoadDataArray];
    [self.tableView registerClass:[LWHomeRecommendViewCell class] forCellReuseIdentifier:kRecommendIdentFiler];
    [self.tableView registerClass:[LWHomeFeaturedTableViewCell class] forCellReuseIdentifier:kFeaturedIdentFiler];
    
    [self setNavigationItemLeftAndRightButton];
    [self addSubViews];
    [self autoLayout];
    
    
}

- (void)example01
{
    __unsafe_unretained __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf downLoadDataArray];
    }];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
}
- (void)example11
{
    [self example01];
    
    __unsafe_unretained __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf downLoadDataArray];
    }];
}


#pragma mark - downLoadDataArray
- (void)downLoadDataArray
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
       
            LWHomeRequestModel *requestModel = [[LWHomeRequestModel alloc] init];
            requestModel.city_id = @324;
            requestModel.lat = @0;
            requestModel.lon = @0;
            requestModel.page = @(ReloadPage);
            requestModel.session_id = kSession_id;
            requestModel.v = @3;
            
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
        
        ReloadPage ++;
        
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
    
    LWHomeResponseModel *model = self.dataArray[indexPath.row];
    
    if([model.item_type isEqualToString:@"leo"])
    {
        // 普通
        NSLog(@"-- 普通页面 %@",model.leo_id);
        
        
    }else
    {
        NSLog(@"-- 推荐页面 %@",model.jump_data);
        
        // 推荐
        LWHomeDetailEnevtListViewController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:kLWHomeDetailViewController];
        detailController.model = model;
        
        [self.navigationController pushViewController:detailController pushType:UINavigationControllerPushTypeFromLeft animated:YES];
    }
    
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
