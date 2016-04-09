//
//  LWHomeResponseModel.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWHomeResponseModel.h"



@implementation LWHomeResponseModel


- (void)setValue:(id)value forKey:(NSString *)key
{
    if([key isEqualToString:@"collected_num"])
    {
        self.collected_num = [NSString stringWithFormat:@"%@人收藏",value];
    }else if([key isEqualToString:@"price"])
    {
        self.price = [NSString stringWithFormat:@"$%@",value];
    }else if ([[self propertyList] containsObject:key]) {
        [super setValue:value forKey:key];
    }
}


- (CGFloat)cellHeight
{
    _cellHeight = ceil(230 + self.titleHeight + 21 + 56);
    
    return _cellHeight;
}

- (CGFloat)titleHeight
{
    CGSize totalSize = CGSizeMake(kScreenWidth-12*2, 1000);
    
    _titleHeight = ceil([self.title calcTextSizeWith:[UIFont systemFontOfSize:15] totalSize:totalSize].height);
    
    return _titleHeight;
}

- (CGFloat)time_info_width
{
    CGSize totalSize = CGSizeMake(kScreenWidth-12*2, 1000);
    
    _time_info_width = ceil([self.time_info calcTextSizeWith:[UIFont systemFontOfSize:12] totalSize:totalSize].width);
    
    return _time_info_width;
}
- (CGFloat)collected_num_width
{
    CGSize totalSize = CGSizeMake(kScreenWidth-12*2, 1000);
    
    _collected_num_width = ceil([self.collected_num calcTextSizeWith:[UIFont systemFontOfSize:12] totalSize:totalSize].width) + 15 + 8;
    
    return _collected_num_width;
}
- (CGFloat)pricewidth
{
    CGSize totalSize = CGSizeMake(kScreenWidth-12*2, 1000);
    
    _pricewidth = ceil([self.price calcTextSizeWith:[UIFont systemFontOfSize:10] totalSize:totalSize].width);
    
    return _pricewidth;
}

@end
