//
//  STWaterFallFlowLayout.h
//  WaterFall
//
//  Created by shine-team2 on 2016/11/7.
//  Copyright © 2016年 ShowTime. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STWaterFallFlowLayout;

@protocol STWaterFallLayoutDelegate <NSObject>

@required
- (CGFloat)waterFallLayout:(STWaterFallFlowLayout *)layout itemWidth:(CGFloat)width indexPath:(NSIndexPath *)indexPath;

@end

@interface STWaterFallFlowLayout : UICollectionViewFlowLayout

- (instancetype)initWithColumnCount:(NSInteger)columnCount;

@property (nonatomic, strong) id<STWaterFallLayoutDelegate> delegate;

@property (nonatomic, assign) NSUInteger columnCount;

- (void)setSpacing:(CGFloat)columnSpacing rowSpacing:(CGFloat)rowSpacing edgeInsets:(UIEdgeInsets)sectionInsets;

@end
