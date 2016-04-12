//
//  LWHomeDataSourceTextTableViewCell.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWHomeDataSourceTextTableViewCell.h"

@interface LWHomeDataSourceTextTableViewCell()


@property (nonatomic, strong) NSArray *strArr;

@end

@implementation LWHomeDataSourceTextTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    return [super initWithStyle:style reuseIdentifier:reuseIdentifier];
}


- (void)setContentText:(NSString *)contentText
{
    [super setContentText:contentText];
    
    // 只有一条数据  就不写加载/布局 私有方法了
    [self.contentView addSubview:self.dataSourceTextLabel];
    self.dataSourceTextLabel.text = self.contentText;
    
    [self.dataSourceTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
}


#pragma mark - Life Cyc
- (NSArray *)strArr
{
    if(!_strArr)
    {
        _strArr = [NSArray array];
    }
    return _strArr;
}

@end
