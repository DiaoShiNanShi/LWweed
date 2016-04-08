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

#import "UIColor+TBAddition.h"
#import "UINavigationController+TBAddition.h"

#import "LWMenuViewController.h"



static int leftIndex = 0;
//static int rightIndex = 0;

@interface LWHomeViewController ()<UITableViewDataSource,UITableViewDelegate>

// 菜单ScrollView
@property (nonatomic, strong) LWMenuScrollVlew *UIMenuScrollView;
@property (nonatomic, strong) LWContenScrollView *contenScrollView;

// 主页TableView
@property (nonatomic, weak) IBOutlet UITableView *tableView;

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
@end

@implementation LWHomeViewController


// 视图将要加载出来
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.alpha = 1;
    [self setNavigationItemLeftAndRightButton];
    [self addSubViews];
    [self autoLayout];
    
    NSLog(@"123");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
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



#pragma mark - AutoLayout
- (void)addSubViews
{
    [self.view addSubview:self.contenScrollView];
    [self.view addSubview:self.UIMenuScrollView];
    
}
- (void)autoLayout
{
    
    [self.contenScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.bottom.left.equalTo(self.view);
        make.height.equalTo(@504);
    }];
    
    
    [self.UIMenuScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(20);
        make.width.left.equalTo(self.view);
        make.bottom.equalTo(self.contenScrollView.mas_top);
        
    }];
    
    self.contenScrollView.contentSize = CGSizeMake(kScreenWidth + 1, 505);
    self.UIMenuScrollView.contentSize = CGSizeMake(kScreenWidth + 1, 468);
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

@end
