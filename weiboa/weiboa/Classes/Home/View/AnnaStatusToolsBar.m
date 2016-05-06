//
//  AnnaStatusToolsBar.m
//  weiboa
//
//  Created by Liangkuai on 16/5/5.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaStatusToolsBar.h"

@implementation AnnaStatusToolsBar
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self setupButtonsWithImage:@"timeline_icon_retweet" backgroundImage:@"timeline_card_bottom_background" highlightBackgroundImage:@"timeline_card_bottom_background_highlighted"];
    
    [self setupButtonsWithImage:@"timeline_icon_comment" backgroundImage:@"timeline_card_bottom_background" highlightBackgroundImage:@"timeline_card_bottom_background_highlighted"];
    
    [self setupButtonsWithImage:@"timeline_icon_unlike" backgroundImage:@"timeline_card_bottom_background" highlightBackgroundImage:@"timeline_card_bottom_background_highlighted"];
    
    return self;
}

- (void)setupButtonsWithImage:(NSString *)image backgroundImage:(NSString *)backgroundImage highlightBackgroundImage:(NSString *)highlightBackgroundImage{
    UIButton *button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:highlightBackgroundImage] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:UIControlStateNormal];
    
    [self addSubview:button];
}

@end
