//
//  STWaterFallCollectionViewCell.m
//  WaterFall
//
//  Created by shine-team2 on 2016/11/7.
//  Copyright © 2016年 ShowTime. All rights reserved.
//

#import "STWaterFallCollectionViewCell.h"

@implementation STWaterFallCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setSubviews];
    }
    return self;
}

- (void)setSubviews {
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
    [self.contentView addSubview:_imageView];
}
@end
