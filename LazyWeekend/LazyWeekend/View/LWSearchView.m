//
//  LWSearchView.m
//  LazyWeekend
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWSearchView.h"

#import "LWSearchCollectionContentViewCell.h"


#define kContentCollectionViewCellIdentfiler    @"kContentCollectionViewCellIdentfiler"

@interface LWSearchView()
<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UISearchBarDelegate>

@property (nonatomic, strong) UIView *searceAddressView;


@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UILabel *searchLabel;
@property (nonatomic, strong) UIImageView *searchIcon;

// 搜索框
@property (nonatomic, strong) UISearchBar *searceBar;

// 内容
@property (nonatomic, strong) UICollectionView *contentView;


#pragma mark - Function
- (void) addSubviews;

- (void) voluation;

- (void) _sizeToFit;

- (void) autoLayout;

@end


@implementation LWSearchView


- (instancetype)init
{
    self = [super init];
    if(self)
    {
        [self.contentView registerClass:[LWSearchCollectionContentViewCell class] forCellWithReuseIdentifier:kContentCollectionViewCellIdentfiler];
        
        [self addSubviews];
        [self voluation];
        [self _sizeToFit];
        [self autoLayout];
        
    }
    return self;
}


#pragma mark Prevate Function
- (void) addSubviews
{
    // 地址部分
    [self addSubview:self.searceAddressView];
    
    // 地址部分
    [self.searceAddressView addSubview:self.searchButton];
    [self.searchButton addSubview:self.searchLabel];
    [self.searchButton addSubview:self.searchIcon];
    
    // 搜索框部分
    [self addSubview:self.searceBar];
    
    // 内容部分
    [self addSubview:self.contentView];
}

- (void) voluation
{
    self.searchLabel.text = @"abc";
}

- (void) _sizeToFit
{
    [self.searchLabel sizeToFit];
}

- (void) autoLayout
{
    
    // 头部地址 视图
    [self.searceAddressView mas_updateConstraints:^(MASConstraintMaker *make) {

        make.top.leading.width.equalTo(self);
        make.height.equalTo(@30);
    }];
    
    
    [self.searchButton mas_updateConstraints:^(MASConstraintMaker *make) {
       
        
        
    }];
    
    
}

#pragma mark - UICollectiondelegate && UICollectionDataSorcue
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LWSearchCollectionContentViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kContentCollectionViewCellIdentfiler forIndexPath:indexPath];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    [cell.contentView addSubview:label];
    
    return cell;
}



#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(60, 60);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


#pragma mark - Life Cyc

- (UIView *)searceAddressView
{
    if(!_searceAddressView)
    {
        _searceAddressView = [[UIView alloc] init];
    }
    return _searceAddressView;
}

- (UIButton *)searchButton
{
    if(!_searchButton)
    {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _searchButton;
}

- (UILabel *)searchLabel
{
    if(!_searchLabel)
    {
        _searchLabel = [[UILabel alloc] init];
    }
    return _searchLabel;
}
- (UIImageView *)searchIcon
{
    if(!_searchIcon)
    {
        _searchIcon = [[UIImageView alloc] init];
        _searchIcon.backgroundColor = [UIColor orangeColor];
    }
    return _searchIcon;
}
- (UICollectionView *)contentView
{
    if(!_contentView)
    {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _contentView = [[UICollectionView alloc] init];
        
        _contentView.collectionViewLayout = flowLayout;
        [_contentView setBackgroundColor:[UIColor redColor]];
        
        _contentView.dataSource = self;
        _contentView.delegate = self;
    }
    return _contentView;
}


@end
