//
//  LWMenuScrollVlew.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWMenuScrollVlew.h"
#import "LWCustomButton.h"

@interface LWMenuScrollVlew ()

@property (nonatomic, strong) UILabel *textLabel;

/**
 *  添加子视图
 */
- (void) addSubViews;

/**
 *  自动布局
 */
- (void) autoLayout;


- (void) eventMethodOnCilcked:(UIButton *)sender;
@end

@implementation LWMenuScrollVlew


- (void)addSubViews
{
    [self addSubview:self.homeButton];
    [self addSubview:self.applySetting];
    [self addSubview:self.aboutXB];
}

- (void)autoLayout
{
}


- (instancetype)init
{
    self = [super init];
    if(self)
    {
        [self addSubViews];
        [self autoLayout];
    }
    return self;
}


#pragma mark - life Cycle

- (LWCustomButton *)homeButton
{
    if(!_homeButton)
    {
        _homeButton = [LWCustomButton createCustomButton:@"首页" withFram:CGRectMake(20, 40, 300, 40)];
        [_homeButton addTarget:self action:@selector(eventMethodOnCilcked:) forControlEvents:UIControlEventTouchUpInside];
        _homeButton.tag = 1;
        
    }
    return _homeButton;
}

- (LWCustomButton *)applySetting
{
    if(!_applySetting)
    {
        _applySetting = [LWCustomButton createCustomButton:@"应用设置" withFram:CGRectMake(20, 90, 300, 40)];
        [_applySetting addTarget:self action:@selector(eventMethodOnCilcked:) forControlEvents:UIControlEventTouchUpInside];
        _applySetting.tag = 2;
    }
    return _applySetting;
}

- (LWCustomButton *)aboutXB
{
    if(!_aboutXB)
    {
        _aboutXB = [LWCustomButton createCustomButton:@"登录" withFram:CGRectMake(20, 140, 300, 40)];
        [_aboutXB addTarget:self action:@selector(eventMethodOnCilcked:) forControlEvents:UIControlEventTouchUpInside];
        _aboutXB.tag = 3;
        
    }
    return _aboutXB;
}

#pragma mark eventMethod
- (void) eventMethodOnCilcked:(UIButton *)sender
{
    LWCustomButton *tmpButtton = (LWCustomButton *)sender;
    tmpButtton.textlable.textColor = [UIColor whiteColor];
    
    switch (tmpButtton.tag) {
        case 1:
        {
            self.applySetting.textlable.textColor = [UIColor colorWithR:132 g:132 b:132 alpha:1];
            self.aboutXB.textlable.textColor = [UIColor colorWithR:132 g:132 b:132 alpha:1];
            break;
        }
        case 2:
        {
            self.homeButton.textlable.textColor = [UIColor colorWithR:132 g:132 b:132 alpha:1];
            self.aboutXB.textlable.textColor = [UIColor colorWithR:132 g:132 b:132 alpha:1];
            break;
        }
        default:
        {
            self.homeButton.textlable.textColor = [UIColor colorWithR:132 g:132 b:132 alpha:1];
            self.applySetting.textlable.textColor = [UIColor colorWithR:132 g:132 b:132 alpha:1];
            break;
        }
    }
    
    
    NSLog(@"点击了-- %@",tmpButtton.textlable.text);
}

@end
