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


#import "LWHomeRecommendViewCell.h"

@interface LWHomeDetailEnevtListViewController()
<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableview;
// 请求的数据
@property (nonatomic, strong) NSMutableArray *dataArray;

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
}
- (void)autoLayout
{
    [self.tableview mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.view);
        
    }];
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

@end
