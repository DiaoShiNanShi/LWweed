//
//  LWSearchButton.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/13.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWSearchButton.h"

@interface LWSearchButton()


@end
@implementation LWSearchButton



- (void) setText:(NSString *)text withImage:(UIImage *)image
{
    
    [self addSubviews];
    self.label.text = text;
    self._imageView.image = image;
    
    [self.label sizeToFit];
    
}


#pragma mark Previate
- (void) addSubviews
{
    [self addSubview:self.label];
    [self addSubview:self._imageView];
}


#pragma mark - Life Cyc
- (UILabel *)label
{
    if(!_label)
    {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:14];
        _label.textAlignment = NSTextAlignmentLeft;
        _label.textColor = [UIColor colorWithR:152 g:152 b:152 alpha:1];
        _label.frame = CGRectMake(33, 5, 0, 20);
    }
    return _label;
}

- (UIImageView *)_imageView
{
    if(!__imageView)
    {
        __imageView = [[UIImageView alloc] init];
        __imageView.frame = CGRectMake(4, 2.5, 25, 25);
    }
    return __imageView;
}

@end
