//
//  LWHomeDetailViewController.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/9.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWHomeDetailEnevtListViewController.h"
#import "LWNetWorkManager.h"
#import "LWHomeDetailRequestModel.h"
#import "LWHomeResponseModel.h"
#import "LWHomeEventNavigationView.h"
#import "LWHomeDetailDataSourceViewController.h"
#import "LWHomeDetailDataSourceRequestModel.h"

#import "LWHomeRecommendViewCell.h"

@interface LWHomeDetailEnevtListViewController()
<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableview;
// 请求的数据
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) LWHomeEventNavigationView *eventNavigationView;
/**
 *  加载数据
 */
- (void) loadDataArray;

/**
 *  添加子视图
 */
- (void) addSubviews;

/**
 *  自动布局
 */
- (void) autoLayout;

/**
 *  返回上一层
 */
- (void) popBack;
@end

@implementation LWHomeDetailEnevtListViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addSubviews];
    [self autoLayout];
    
    [self.tableview registerClass:[LWHomeRecommendViewCell class] forCellReuseIdentifier:KRecommendDetailIdentFiler];
    [self loadDataArray];
}



#pragma mark - Previte

- (void)addSubviews
{
    [self.view addSubview:self.tableview];
    [self.view addSubview:self.eventNavigationView];
}
- (void)autoLayout
{
    [self.eventNavigationView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@44);
    }];
    
    [self.tableview mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.view);
        
    }];
}
- (void)popBack
{
   [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:([self.navigationController.viewControllers count] -2)] animated:YES];
}


- (void)loadDataArray
{
    LWHomeDetailRequestModel *requestModel = [[LWHomeDetailRequestModel alloc] init];
    requestModel.strid = self.model.jump_data;
    requestModel.lon = requestModel.lat = @0;
    requestModel.session_id = kSession_id;
    
    [[LWNetWorkManager sharNetWorkManager] networkRequestsWithModel:requestModel withDataType:DataTypeDetail withCompletionHandler:^(id result, NSError *error) {
        
        if(error)
        {
            return ;
        }
        
        [self.dataArray addObjectsFromArray:result];
        [self.tableview reloadData];
        
        
    } withRequestWay:kGET];
    
    
}

#pragma mark - <UITableViewDelegate,UITableViewDataSouce>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LWHomeResponseModel *model = self.dataArray[indexPath.row];
    LWHomeRecommendViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KRecommendDetailIdentFiler forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LWHomeResponseModel *model = self.dataArray[indexPath.row];
    
    return model.cellHeight;
}

// 点击进入详细页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LWHomeResponseModel *dataModel = self.dataArray[indexPath.row];
    LWHomeDetailDataSourceViewController *detailController = [[LWHomeDetailDataSourceViewController alloc] init];
    LWHomeDetailDataSourceRequestModel *requestModel = [[LWHomeDetailDataSourceRequestModel alloc] init
                                                        ];
    
    requestModel.leo_id = dataModel.leo_id;
    requestModel.session_id = kSession_id;
    requestModel.v = @4;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [[LWNetWorkManager sharNetWorkManager] networkRequestsWithModel:requestModel withDataType:DataTypeDataSource withCompletionHandler:^(id result, NSError *error) {
            
            if(error)
            {
                return ;
            }
            detailController.model = result;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.navigationController pushViewController:detailController animated:YES];
            });
            
        } withRequestWay:kGET];
    });
    
}


#pragma mark - Lefe Cyc
- (NSMutableArray *)dataArray
{
    if(!_dataArray)
    {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (UITableView *)tableview
{
    if(!_tableview)
    {
        _tableview = [[UITableView alloc] init];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}
- (LWHomeEventNavigationView *)eventNavigationView
{
    if(!_eventNavigationView)
    {
        _eventNavigationView = [[LWHomeEventNavigationView alloc] init];
        _eventNavigationView.backgroundColor = [UIColor colorWithR:247 g:247 b:247 alpha:0.9];
        _eventNavigationView.centerLabelTitle.text = self.model.title;
        
        [_eventNavigationView.leftButton addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _eventNavigationView;
}

@end
