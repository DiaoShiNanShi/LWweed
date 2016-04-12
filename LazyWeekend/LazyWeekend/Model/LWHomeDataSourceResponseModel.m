//
//  LWHomeDataSourceResponseModel.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/10.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWHomeDataSourceResponseModel.h"

@implementation LWHomeDataSourceResponseModel


- (void)setValue:(id)value forKey:(NSString *)key
{
    if([key isEqualToString:@"category"])
    {
        self.category_icon = value[@"icon_view"];
        self.category_name = value[@"cn_name"];
        
    }else if([key isEqualToString:@"time"])
    {
        self.time = value[@"info"];
        
    }else if([key isEqualToString:@"description"])
    {
        self.descriptionArray = value;
        
    }else
    {
        if([[self propertyList] containsObject:key])
        {
        
            [super setValue:value forKey:key];
        }
    }
}



- (CGFloat)titleHeight
{
    CGSize totalSize = CGSizeMake(kScreenWidth-15*2, 1000);
    
    _titleHeight = ceil([self.title calcTextSizeWith:[UIFont systemFontOfSize:18] totalSize:totalSize].height);
    
    return _titleHeight;
}

- (CGFloat)dataTextHeight
{
    if(_dataTextHeight == 0)
    {
        for (NSDictionary *item in self.descriptionArray) {
            
            if([item[@"type"] isEqualToString:@"text"])
            {
                CGSize totalSize = CGSizeMake(kScreenWidth-15*2, 1000);
                CGFloat textheight;
                NSArray *tmpArr = [item[@"content"] componentsSeparatedByString:@"\r\n"];
                
                for (NSString *item in tmpArr) {
                    
                    textheight += ceil([item calcTextSizeWith:[UIFont fontWithName:@"FZLTXHK--GBK1-0" size:13] totalSize:totalSize].height);
                    
                }
                _dataTextHeight = textheight;
                
            }else
            {
                _dataPictureHeight += 200;
            }
            
        }
        
    }
    return _dataTextHeight;
}

@end
