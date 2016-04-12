//
//  LWBaseDataSourceViewCell.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseDataSourceViewCell.h"

@implementation LWBaseDataSourceViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


#pragma mark - Life Cyc
- (UIImageView *)picture
{
    if(!_picture)
    {
        _picture = [[UIImageView alloc] init];
    }
    return _picture;
}

- (UILabel *)dataSourceTextLabel
{
    if(!_dataSourceTextLabel)
    {
        _dataSourceTextLabel = [[UILabel alloc] init];
        _dataSourceTextLabel.font = [UIFont fontWithName:@"FZLTXHK--GBK1-0" size:13];
        _dataSourceTextLabel.numberOfLines = 0;
        _dataSourceTextLabel.textColor = [UIColor blackColor];
        
    }
    return _dataSourceTextLabel;
}

- (void)setContentText:(NSString *)contentText
{
    _contentText = contentText;
}

@end
