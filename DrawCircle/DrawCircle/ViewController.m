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

@interface ViewController ()

@property (nonatomic, strong) CustomView *customView;

@property (nonatomic, strong) UAProgressView *progressView;

@property (nonatomic, assign) CGFloat localProgress;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.progressView];
    _localProgress = 0.5;
    self.progressView.progress = 0.5;
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)updateProgress:(NSTimer *)timer {
    
    _localProgress = ((int)((_localProgress * 100.0f) + 1.01) % 100) / 100.0f;
    
    [self.progressView setProgress:_localProgress animated:YES];
}

#pragma mark --------------------- properties -----------------------

- (CustomView *)customView {
    
    if (!_customView) {
        _customView = [[CustomView alloc]initWithFrame:self.view.bounds];
    }
    return _customView;
}

- (UAProgressView *)progressView {
    
    if (!_progressView) {
        _progressView = [[UAProgressView alloc]initWithFrame:CGRectMake(self.view.center.x - 50, self.view.center.y - 50, 100, 100)];
        _progressView.layer.cornerRadius = 50;
        _progressView.tintColor = [UIColor whiteColor];
        _progressView.lineWidth = 10.0f;
        _progressView.borderWidth = 10.0f;
    }
    return _progressView;
}
@end
