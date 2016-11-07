//
//  STWaterFallFlowLayout.m
//  WaterFall
//
//  Created by shine-team2 on 2016/11/7.
//  Copyright © 2016年 ShowTime. All rights reserved.
//

#import "STWaterFallFlowLayout.h"

@interface STWaterFallFlowLayout()

@property (nonatomic, assign) NSInteger cellCount;      //cell个数

@property (nonatomic, strong) NSMutableArray *columnHeightArr;        //cell高度

@property (nonatomic, strong) NSMutableArray *attributeArr;

@property (nonatomic, assign) CGFloat columSpacing;

@property (nonatomic, assign) CGFloat rowSpacing;

@property (nonatomic, assign) UIEdgeInsets sectionInsets;

@end

@implementation STWaterFallFlowLayout

- (instancetype)init {
    
    if (self = [super init]) {
        self.columnCount = 2;
    }
    return self;
}

- (instancetype)initWithColumnCount:(NSInteger)columnCount {
    if (self = [super init]) {
        _columnCount = columnCount;
    }
    return self;
}

- (void)setSpacing:(CGFloat)columnSpacing rowSpacing:(CGFloat)rowSpacing edgeInsets:(UIEdgeInsets)sectionInsets {
    
    self.columSpacing = columnSpacing;
    self.rowSpacing = rowSpacing;
    self.sectionInset = sectionInsets;
}

//准备布局
- (void)prepareLayout {
    
    [super prepareLayout];
    
    [self.columnHeightArr removeAllObjects];
    
    _cellCount = [self.collectionView numberOfItemsInSection:0];
    
    if (_cellCount == 0) {
        return;
    }
    
    float top = 0;
    for (int i = 0; i < self.columnCount; i++) {
        [_columnHeightArr addObject:[NSNumber numberWithFloat:top]];
    }
    
    [self.attributeArr removeAllObjects];
    for (int i = 0; i < _cellCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attributeArr addObject:attrs];
    }
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    return self.attributeArr;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat xPadding = self.sectionInset.left + self.sectionInset.right + (self.columnCount - 1) * self.columSpacing;
    CGFloat cellWidth = (self.collectionView.frame.size.width - xPadding) / self.columnCount;
    
    CGFloat shortColumnHeight = [[_columnHeightArr objectAtIndex:0] floatValue];
    NSUInteger shortColumnNum = 0;
    for (int i = 0; i < _columnHeightArr.count; i++) {
        CGFloat height = [[_columnHeightArr objectAtIndex:i] floatValue];
        if (height < shortColumnHeight) {
            shortColumnHeight = height;
            shortColumnNum = i;
        }
    }
    
    CGFloat xLocation = self.sectionInset.left + shortColumnNum * (cellWidth + self.columSpacing);
    CGFloat yLocation = shortColumnHeight + self.sectionInset.top;
    
    CGFloat height = [self.delegate waterFallLayout:self itemWidth:cellWidth indexPath:indexPath];
    
    attrs.frame = CGRectMake(xLocation, yLocation, cellWidth, height);
    self.columnHeightArr[shortColumnNum] = @(CGRectGetMaxY(attrs.frame));
    
    return attrs;
}

- (CGSize)collectionViewContentSize {
    
    CGSize size = self.collectionView.frame.size;
    float maxHeight = [[_columnHeightArr objectAtIndex:0] floatValue];
    for (int i = 0; i < _columnHeightArr.count; i++) {
        float colHeight = [[_columnHeightArr objectAtIndex:i] floatValue];
        if (colHeight > maxHeight) {
            maxHeight = colHeight;
        }
    }
    size.height = maxHeight;
    return size;
}

#pragma mark ---------- properties ----------

- (NSMutableArray *)columnHeightArr {
    
    if (!_columnHeightArr) {
        _columnHeightArr = [NSMutableArray array];
    }
    return _columnHeightArr;
}

- (NSMutableArray *)attributeArr {
    
    if (!_attributeArr) {
        _attributeArr = [NSMutableArray array];
    }
    return _attributeArr;
}
@end
