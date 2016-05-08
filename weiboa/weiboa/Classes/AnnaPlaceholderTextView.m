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
#warning 因为设置代理需要把逻辑方法被添加的控制器上.不符合封装的理念.所以这里使用了通知.当需要自己成为自己的代理.或者层级关系太深的时候就可以使用通知
    [AnnaNotiifcationCenter addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    UILabel *placeholder = [[UILabel alloc]init];
    self.placeholder = placeholder;
    
    placeholder.userInteractionEnabled = NO;
    placeholder.textColor = [UIColor grayColor];
    
    [self addSubview:placeholder];
}

#pragma mark - 占位符文本
-(void)setPlaceholderText:(NSString *)placeholderText{
    _placeholderText = placeholderText;
    self.placeholder.text = placeholderText;
    [self.placeholder sizeToFit];
    
    [self setNeedsLayout];

}

#pragma mark - 字体
- (void) setTextFont:(UIFont *)textFont{
    _textFont = textFont;
    self.placeholder.font = textFont;
    self.font = textFont;
    
    [self setNeedsLayout];

}

#pragma mark - 设置文字颜色
-(void)setTextColor:(UIColor *)textColor{
    [super setTextColor:textColor];
    self.placeholder.textColor = [AnnaPlaceholderTextView lightColor:textColor];
}

//返回浅色
+ (UIColor *)lightColor:(UIColor *)targetColor{
    CGFloat R, G, B;
    
    CGColorRef color = [targetColor CGColor];
    
    NSInteger numComponents = CGColorGetNumberOfComponents(color);
    
    if (numComponents == 4)
    {
        const CGFloat *components = CGColorGetComponents(color);
        R = MIN(components[0], 1);
        G = MIN(components[1], 1);
        B = MIN(components[2], 1);
    }
    return [UIColor colorWithRed:(R + 0.4) green:(G + 0.4) blue:(B + 0.5) alpha:1];
}

#pragma mark - 类方法初始化textView
+ (instancetype)placeholderTextViewWithText:(NSString *)placeholder Font:(UIFont *)font{
    AnnaPlaceholderTextView *placeholderTextView = [[self alloc]init];
    
    placeholderTextView.placeholderText = placeholder;
    placeholderTextView.font = font;
    placeholderTextView.placeholder.font = font;
    
    return placeholderTextView;

}

- (void)textDidChange{
    
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.hasText) {
        self.placeholder.hidden = YES;
        return;
    }
    
    self.placeholder.hidden = NO;
    CGFloat placeholderX = 5;
    CGFloat placeholderY = 7;
    self.placeholder.origin = CGPointMake(placeholderX, placeholderY);
}

@end
