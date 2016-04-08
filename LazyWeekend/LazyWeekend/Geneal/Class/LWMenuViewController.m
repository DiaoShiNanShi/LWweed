//
//  LWMenuViewController.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWMenuViewController.h"

@interface LWMenuViewController ()


@property (nonatomic, weak) IBOutlet UITableView *menuTableView;

@end

@implementation LWMenuViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.menuTableView.backgroundColor = [UIColor blackColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}
@end
