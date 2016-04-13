//
//  LWSearchScrollView.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>


// Search 的代理
@protocol LWSearchButtonDelegate <NSObject>

// Search 按钮代理 点击事件
- (void)searchButton:(UIButton *)sender;


@end



@interface LWSearchScrollView : UIScrollView

// 存放 所有控件
@property (nonatomic, strong) NSMutableArray *objArr;
@property (weak, nonatomic) id<LWSearchButtonDelegate> searchButtonDelegate;

@end
