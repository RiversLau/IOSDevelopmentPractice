//
//  STWaterFallFlowLayout.m
//  WaterFall
//
//  Created by shine-team2 on 2016/11/7.
//  Copyright © 2016年 ShowTime. All rights reserved.
//

#import "STWaterFallFlowLayout.h"

CGFloat const ColumnCount = 3;

@implementation STWaterFallFlowLayout

//准备布局
- (void)prepareLayout {
    
    [super prepareLayout];
    
    [self.columnHeightArr removeAllObjects];
    
    self.delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    _cellCount = [self.collectionView numberOfItemsInSection:0];
    
    if (_cellCount == 0) {
        return;
    }
    
    float top = 0;
    for (int i = 0; i < ColumnCount; i++) {
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
    
    UIEdgeInsets edgeInsets = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.row];
    CGFloat xPadding = edgeInsets.left + edgeInsets.left + (ColumnCount - 1) * (edgeInsets.left + edgeInsets.right);
    CGFloat cellWidth = (self.collectionView.frame.size.width - xPadding) / ColumnCount;
    
    CGSize itemSize = [self.delegate collectionView:self.autoContentAccessingProxy layout:self sizeForItemAtIndexPath:indexPath];
    
    CGFloat shortColumnHeight = [[_columnHeightArr objectAtIndex:0] floatValue];
    NSUInteger shortColumnNum = 0;
    for (int i = 0; i < _columnHeightArr.count; i++) {
        CGFloat height = [[_columnHeightArr objectAtIndex:i] floatValue];
        if (height < shortColumnHeight) {
            shortColumnHeight = height;
            shortColumnNum = i;
        }
    }
    
    CGFloat xLocation = edgeInsets.left + shortColumnNum * (cellWidth + edgeInsets.left + edgeInsets.right);
    CGFloat yLocation = shortColumnHeight + edgeInsets.top;
    
    attrs.frame = CGRectMake(xLocation, yLocation, cellWidth, itemSize.height);
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
