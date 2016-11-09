//
//  ViewController.m
//  DrawCircle
//
//  Created by shine-team2 on 2016/11/8.
//  Copyright © 2016年 ShowTime. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import "UAProgressView.h"
#import "STZhiHuLoading.h"

@interface ViewController ()

@property (nonatomic, strong) CustomView *customView;

@property (nonatomic, strong) UAProgressView *progressView;

@property (nonatomic, assign) CGFloat localProgress;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(0, 0, 150, 150);
    self.shapeLayer.position = self.view.center;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    //设置线条的宽度和颜色
    self.shapeLayer.lineWidth = 10.0f;
    self.shapeLayer.lineCap = kCALineCapRound;
    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    //设置stroke起始点
    self.shapeLayer.strokeStart = M_PI / 2;
    self.shapeLayer.strokeEnd = 0;
    _localProgress = 0.05;
    
    //创建出圆形贝塞尔曲线
//    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 150, 150)];
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:75 startAngle:M_PI / 2 endAngle:M_PI * 1 / 8 clockwise:YES];
    
    //让贝塞尔曲线与CAShapeLayer产生联系
    self.shapeLayer.path = circlePath.CGPath;
    
    //添加并显示
    [self.view.layer addSublayer:self.shapeLayer];
    
    [self start];
}

- (void)start {
    
    //用定时器模拟数值输入的情况
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                              target:self
                                            selector:@selector(circleAnimationTypeOne)
                                            userInfo:nil
                                             repeats:YES];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)circleAnimationTypeOne {
    
    if (self.shapeLayer.strokeEnd > 1 && self.shapeLayer.strokeStart < 1) {
        self.shapeLayer.strokeStart += _localProgress;
    } else if(self.shapeLayer.strokeStart == 0){
        self.shapeLayer.strokeEnd += _localProgress;
    }
    
    if (self.shapeLayer.strokeEnd == 0) {
        self.shapeLayer.strokeStart = 0;
    }
    
    if (self.shapeLayer.strokeStart == self.shapeLayer.strokeEnd) {
        self.shapeLayer.strokeEnd = 0;
    }
}

- (void)circleAnimationTypeTwo {
    
    CGFloat valueOne = arc4random() % 100 / 100.0f;
    CGFloat valueTwo = arc4random() % 100 / 100.0f;
    
    self.shapeLayer.strokeStart = valueOne < valueTwo ? valueOne : valueTwo;
    self.shapeLayer.strokeEnd = valueTwo > valueOne ? valueTwo : valueOne;
}
#pragma mark --------------------- properties -----------------------

@end
