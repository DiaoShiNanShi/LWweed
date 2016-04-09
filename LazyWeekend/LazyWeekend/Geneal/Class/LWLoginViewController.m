//
//  LWLoginViewController.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/9.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWLoginViewController.h"

@interface LWLoginViewController ()

- (void)setNavigationItemLeftButton;

@end

@implementation LWLoginViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavigationItemLeftButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavigationItemLeftButton
{
    UIImage *leftBacImage = [UIImage imageNamed:@"cat_me"];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[leftBacImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(customleftBarButtonItemOnClick)];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithR:246 g:247 b:247 alpha:1];
    
}

- (void)customleftBarButtonItemOnClick
{
    
}
@end
