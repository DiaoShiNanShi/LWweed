//
//  LWSearchButton.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/13.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWSearchButton : UIButton

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *_imageView;


- (void) setText:(NSString *)text withImage:(UIImage *)image;

@end
