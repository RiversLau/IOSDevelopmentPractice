//
//  STWaterFallFlowLayout.h
//  WaterFall
//
//  Created by shine-team2 on 2016/11/7.
//  Copyright © 2016年 ShowTime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STWaterFallFlowLayout : UICollectionViewFlowLayout

//id<>带括号表示什么意思呢？为什么要用assign？
@property (nonatomic, assign) id<UICollectionViewDelegateFlowLayout> delegate;

@property (nonatomic, assign) NSInteger cellCount;      //cell个数

@property (nonatomic, strong) NSMutableArray *columnHeightArr;        //cell高度

@property (nonatomic, strong) NSMutableArray *attributeArr;

@end
