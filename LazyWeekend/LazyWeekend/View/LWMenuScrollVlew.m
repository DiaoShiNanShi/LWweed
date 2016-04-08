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


- (void) eventMethodHomeOnCilcked:(UIButton *)sender;
- (void) eventMethodAppSttingOnCilcked:(UIButton *)sender;
- (void) eventMethodAboutXBOnCilcked:(UIButton *)sender;
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
//    [self.homeButton mas_updateConstraints:^(MASConstraintMaker *make) {
//       
//        make.left.equalTo(self).offset(20);
//        make.top.equalTo(self).offset(40);
//        make.height.equalTo(@40);
//        make.right.equalTo(self);
//    }];
//    
//    [self.applySetting mas_updateConstraints:^(MASConstraintMaker *make) {
//        
//        make.left.right.height.equalTo(self.homeButton);
//        make.top.equalTo(self.homeButton.mas_bottom).offset(10);
//    }];
//    
//    [self.aboutXB mas_updateConstraints:^(MASConstraintMaker *make) {
//        
//        make.left.right.height.equalTo(self.applySetting);
//        make.top.equalTo(self.applySetting.mas_bottom).offset(10);
//    }];
    
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
        [_homeButton addTarget:self action:@selector(eventMethodHomeOnCilcked:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _homeButton;
}

- (LWCustomButton *)applySetting
{
    if(!_applySetting)
    {
        _applySetting = [LWCustomButton createCustomButton:@"应用设置" withFram:CGRectMake(20, 90, 300, 40)];
        [_applySetting addTarget:self action:@selector(eventMethodAppSttingOnCilcked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _applySetting;
}

- (LWCustomButton *)aboutXB
{
    if(!_aboutXB)
    {
        _aboutXB = [LWCustomButton createCustomButton:@"关于XB" withFram:CGRectMake(20, 140, 300, 40)];
        [_applySetting addTarget:self action:@selector(eventMethodAboutXBOnCilcked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _aboutXB;
}

#pragma mark eventMethod
- (void) eventMethodHomeOnCilcked:(UIButton *)sender
{
    NSLog(@"点击了-- %@",((LWCustomButton *)sender).textlable.text);
}
- (void) eventMethodAppSttingOnCilcked:(UIButton *)sender
{
    NSLog(@"点击了-- %@",((LWCustomButton *)sender).textlable.text);
}
- (void) eventMethodAboutXBOnCilcked:(UIButton *)sender
{
    NSLog(@"点击了-- %@",((LWCustomButton *)sender).textlable.text);
}

@end
