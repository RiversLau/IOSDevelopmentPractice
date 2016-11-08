//
//  CustomView.m
//  DrawCircle
//
//  Created by shine-team2 on 2016/11/8.
//  Copyright © 2016年 ShowTime. All rights reserved.
//

#import "CustomView.h"
#import <QuartzCore/QuartzCore.h>

#define PI 3.14159265358979323846

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 1, 0, 0, 1);
    
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1.0);
    CGContextSetLineWidth(context, 2.0);
    
    CGContextAddArc(context, 100, 200, 50, 0, 2 * PI, 0);
    CGContextDrawPath(context, kCGPathStroke);
}
@end
