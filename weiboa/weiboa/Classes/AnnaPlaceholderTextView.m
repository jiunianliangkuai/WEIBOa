//
//  AnnaPlaceholderTextView.m
//  weiboa
//
//  Created by Liangkuai on 16/5/8.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaPlaceholderTextView.h"


@interface AnnaPlaceholderTextView ()

@property (weak, nonatomic)UILabel *placeholder;

@end

@implementation AnnaPlaceholderTextView

#pragma mark - 重写初始化方法自定义控件
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupView];
    }
    return self;
}

#pragma mark - 自定义控件
- (void)setupView{
    UILabel *placeholder = [[UILabel alloc]init];
    self.placeholder = placeholder;
    [self addSubview:placeholder];
}


+ (instancetype)placeholderTextView{
    AnnaPlaceholderTextView *placeholderTextView = [[self alloc]init];
    
    return placeholderTextView;
}

-(void)setPlaceholderText:(NSString *)placeholderText{
    self.placeholder.text = placeholderText;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat placeholderX = 0;
    CGFloat placeholderY = 0;
    CGFloat placeholderWidth = 30;
    CGFloat placeholderHeight = 15;
    
    self.placeholder.frame = CGRectMake(placeholderX, placeholderY, placeholderWidth, placeholderHeight);
}

@end
