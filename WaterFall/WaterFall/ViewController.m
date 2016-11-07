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

#define ImageCount 5
#define Column 3

static NSString *CollectionViewCell = @"collectionCell";

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, STWaterFallLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *imageList;

@property (nonatomic, assign) CGFloat cellWidth;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark -- collection view delegate and datasource --

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.imageList.count;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 10, 10, 0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    STWaterFallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCell forIndexPath:indexPath];
    
    cell.imageView.image = _imageList[indexPath.row];
    return cell;
}

#pragma mark -- 图片高度协议 --

- (CGFloat)waterFallLayout:(STWaterFallFlowLayout *)layout itemWidth:(CGFloat)width indexPath:(NSIndexPath *)indexPath {
    
    UIImage *image = _imageList[indexPath.row];
    
    CGFloat height = image.size.height / image.size.width * width;
    return height;
}

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        STWaterFallFlowLayout *layout = [[STWaterFallFlowLayout alloc]initWithColumnCount:3];
        layout.delegate = self;
        [layout setSpacing:10 rowSpacing:10 edgeInsets:UIEdgeInsetsMake(10, 10, 0, 10)];
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
