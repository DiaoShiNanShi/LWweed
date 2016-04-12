//
//  LWCustomButton.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWCustomButton.h"


@interface LWCustomButton ()


// 添加label 并设置值
- (void) setTextLabelText:(NSString *)text;

@end

@implementation LWCustomButton


- (void)setTextLabelText:(NSString *)text
{
    [self addSubview:self.textlable];
    self.textlable.text = text;
}

+ (instancetype)createCustomButton:(NSString *)labelText withFram:(CGRect)rect
{
    LWCustomButton *customButton = [self buttonWithType:UIButtonTypeCustom];
    
    [customButton setTextLabelText:labelText];
    customButton.frame = rect;
    customButton.backgroundColor = [UIColor clearColor];
    
    return customButton;
}


#pragma mark - life Cycle
- (UILabel *)textlable
{
    if(!_textlable)
    {
        _textlable = [[UILabel alloc] init];
        _textlable.frame = CGRectMake(0, 0, 100, 40);
        _textlable.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:20];
        _textlable.textColor = [UIColor colorWithR:132 g:132 b:132 alpha:1];
        _textlable.textAlignment = NSTextAlignmentLeft;
    }
    return _textlable;
}

@end
