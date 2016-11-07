//
//  ViewController.m
//  WaterFall
//
//  Created by shine-team2 on 2016/11/7.
//  Copyright © 2016年 ShowTime. All rights reserved.
//

#import "ViewController.h"
#import "STWaterFallFlowLayout.h"
#import "STWaterFallCollectionViewCell.h"

#define ImageCount 12
#define Column 3

static NSString *CollectionViewCell = @"collectionCell";

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *imageList;

@property (nonatomic, assign) CGFloat cellWidth;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _cellWidth = ([[UIScreen mainScreen] bounds].size.width - 30) / Column;
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark -- collection view delegate and datasource --

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.imageList.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIImage *image = _imageList[indexPath.row];
    CGFloat height = [self imageHeight:image.size.height width:image.size.width];
    return CGSizeMake(_cellWidth, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 10, 10, 0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    STWaterFallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCell forIndexPath:indexPath];
//    cell.image = _imageList[indexPath.item];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark -- 计算图片高度 --

- (CGFloat)imageHeight:(CGFloat)height width:(CGFloat)width {
    
    float newHeight = height / width * _cellWidth;
    return newHeight;
}

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        STWaterFallFlowLayout *layout = [[STWaterFallFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[STWaterFallCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewCell];
    }
    return _collectionView;
}

- (NSMutableArray *)imageList {
    
    if (!_imageList) {
        _imageList = [NSMutableArray array];
        for (int i = 1; i <= ImageCount; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"fengjing%d", i]];
            [_imageList addObject:image];
        }
    }
    return _imageList;
}
@end
