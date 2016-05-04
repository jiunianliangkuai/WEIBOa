//
//  AnnaSearchBar.m
//  weiboa
//
//  Created by Liangkuai on 16/5/3.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaSearchBar.h"

@implementation AnnaSearchBar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

-(void)setup{
    UIImageView *leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
    leftImageView.frame = CGRectMake(0, 0, 30, 30);
    leftImageView.contentMode = UIViewContentModeCenter;
    self.leftView = leftImageView;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.placeholder = @"请输入搜索关键字";
    self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
}
@end
