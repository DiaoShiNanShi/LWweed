//
//  LWBaseViewController.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseViewController.h"

@interface LWBaseViewController ()

@end

@implementation LWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:247 green:248 blue:248 alpha:1];
    self.view.userInteractionEnabled = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc
{
    NSLog(@"%s - %@",__func__,@"正常释放");
}

@end
