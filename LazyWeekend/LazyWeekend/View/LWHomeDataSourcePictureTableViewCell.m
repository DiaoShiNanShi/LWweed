//
//  LWHomeDataSourceTableViewCell.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWHomeDataSourcePictureTableViewCell.h"

@interface LWHomeDataSourcePictureTableViewCell()

@end

@implementation LWHomeDataSourcePictureTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        // 只有一条数据  就不写加载/布局 私有方法了
        [self.contentView addSubview:self.picture];
        
        [self.picture mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.contentView).offset(19);
            make.left.right.bottom.equalTo(self.contentView);
        }];
        
    }
    return self;
}


@end
