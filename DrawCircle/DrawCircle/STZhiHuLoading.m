//
//  STZhiHuLoading.m
//  DrawCircle
//
//  Created by LiuRivers on 2016/11/8.
//  Copyright © 2016年 ShowTime. All rights reserved.
//

#import "STZhiHuLoading.h"

@interface STZhiHuLoading()

@property (nonatomic, strong) CAShapeLayer *cycleLayer;

@end

@implementation STZhiHuLoading

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)didMoveToWindow {
    
    [super didMoveToWindow];
    [self updateUI];
}

- (void)setupUI {
    
    if (!_cycleLayer) {
        _cycleLayer = [[CAShapeLayer alloc]init];
    }
    
    _cycleLayer.lineCap = kCALineCapRound;
    _cycleLayer.lineJoin = kCALineJoinRound;
    _cycleLayer.lineWidth = 10;
    _cycleLayer.fillColor = [UIColor clearColor].CGColor;
    _cycleLayer.strokeColor = [UIColor redColor].CGColor;
    _cycleLayer.strokeEnd = 0;
    
    [self.layer addSublayer:_cycleLayer];
}

- (void)updateUI {
    
    _cycleLayer.frame = self.bounds;
    _cycleLayer.path = (__bridge CGPathRef _Nullable)([UIBezierPath bezierPathWithOvalInRect:self.bounds]);
}

- (void)startLoading {
    
    self.alpha = 1.0;
    
    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.fromValue = @(-1);
    strokeStartAnimation.toValue = @(0);
    
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.fromValue = @(0);
    strokeEndAnimation.toValue = @(1.0);
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 2.0;
    animationGroup.repeatCount = 5;
    animationGroup.animations = [NSArray arrayWithObjects:strokeStartAnimation, strokeEndAnimation,nil];
    
    [_cycleLayer addAnimation:animationGroup forKey:@"animationGroup"];
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.fromValue = @(0);
    rotateAnimation.toValue = @(M_PI * 2);
    rotateAnimation.repeatCount = 5;
    rotateAnimation.duration = 8.0;
    [_cycleLayer addAnimation:rotateAnimation forKey:@"rotateAnimation"];
}

- (void)stopLoading {
    
    
}
@end
