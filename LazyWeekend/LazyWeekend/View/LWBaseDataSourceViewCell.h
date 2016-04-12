//
//  LWBaseDataSourceViewCell.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWBaseDataSourceViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *picture;


// ---- 文字
@property (nonatomic, strong) UILabel *dataSourceTextLabel;
@property (nonatomic, copy) NSString *contentText;


@end
