//
//  AnnaInputToolsBar.m
//  weiboa
//
//  Created by Liangkuai on 16/5/8.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaInputToolsBar.h"


@interface AnnaInputToolsBar ()

@end

@implementation AnnaInputToolsBar

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
    
}


+ (instancetype)inputToolsBar{
    AnnaInputToolsBar *inputToolsBar = [[self alloc]init];
    
    return inputToolsBar;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
}

@end
