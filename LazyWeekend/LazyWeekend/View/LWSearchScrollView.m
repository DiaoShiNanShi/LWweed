//
//  LWSearchScrollView.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWSearchScrollView.h"
#import "LWSearchButton.h"

@interface LWSearchScrollView()


@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *textArray;

@end

@implementation LWSearchScrollView

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        for (LWSearchButton *item in self.objArr) {
            
            [self addSubview:item];
        }
        
    }
    return self;
}



#pragma mark - Life Cyc
- (NSMutableArray *)objArr
{
    if(!_objArr)
    {
        _objArr = [NSMutableArray array];
        
        CGFloat x,y,height = 30,width = 84;
        
        for (int i = 0; i < 13; i++) {
        
            x = (((i % 3) + 1) * 17) + (width * (i % 3));
            
            y = (((i / 3) + 1) * 17) + (height * (i / 3));
            
            LWSearchButton *btn = [[LWSearchButton alloc] init];;
            [btn setText:self.textArray[i] withImage:self.imageArray[i]];
            btn.tag = i;
            [btn addTarget:self action:@selector(searchOnClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.frame = CGRectMake(x, y, width, height);
            
            [self.objArr addObject:btn];
        }
    }
    return _objArr;
}

#pragma mark SelfDelegate
- (void) searchOnClick:(UIButton *)sender
{
    // 代理
    [self.searchButtonDelegate searchButton:sender];
}

- (NSArray *)imageArray
{
    if(!_imageArray)
    {
        _imageArray = @[[UIImage imageNamed:@"ic_all_small_gray"],
                        [UIImage imageNamed:@"ic_c_montain_samll_small"],
                        [UIImage imageNamed:@"ic_bar_small_small"],
                        [UIImage imageNamed:@"ic_music_small_small"],
                        [UIImage imageNamed:@"ic_c_stage_small_small"],
                        [UIImage imageNamed:@"ic_pic_small_small"],
                        [UIImage imageNamed:@"ic_food_small_small"],
                        [UIImage imageNamed:@"ic_bag_small_small"],
                        [UIImage imageNamed:@"ic_movie_small_small"],
                        [UIImage imageNamed:@"ic_persons_small_small"],
                        [UIImage imageNamed:@"ic_basketball_small_small"],
                        [UIImage imageNamed:@"ic_c_leaf_small_small"],
                        [UIImage imageNamed:@"ic_c_shirt_small_small"]];
    }
    return _imageArray;
}
- (NSArray *)textArray
{
    if(!_textArray)
    {
        _textArray = @[@"全部类目",@"周边游",@"酒吧",@"音乐",@"戏剧",@"展览",@"美食",@"购物",@"电影",@"聚会",@"运动",@"公益",@"商业"];
    }
    return _textArray;
}

@end
