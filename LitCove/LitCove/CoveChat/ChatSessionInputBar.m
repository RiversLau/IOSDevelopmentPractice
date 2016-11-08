//
//  ChatSessionInputBar.m
//  LitCove
//
//  Created by shine-team2 on 2016/11/8.
//  Copyright © 2016年 ShowTime. All rights reserved.
//

#import "ChatSessionInputBar.h"

@interface ChatSessionInputBar()

//背景
@property (nonatomic, strong) UIImageView *backgroundView;

//语音
@property (nonatomic, strong) UIButton *voiceBtn;

//表情
@property (nonatomic, strong) UIButton *emojiBtn;

//扩展
@property (nonatomic, strong) UIButton *pluginBtn;

//文本输入框
@property (nonatomic, strong) UITextField *textField;

@end

@implementation ChatSessionInputBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    [self addSubview:self.backgroundView];
}


@end
