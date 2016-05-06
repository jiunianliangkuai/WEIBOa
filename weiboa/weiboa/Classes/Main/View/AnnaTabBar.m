//
//  AnnaTabBar.m
//  weiboa
//
//  Created by Liangkuai on 16/5/6.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaTabBar.h"

@interface AnnaTabBar ()

@property (weak, nonatomic)UIButton *plusBtn;

@end

@implementation AnnaTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.itemPositioning = UITabBarItemPositioningCentered;
    
    // 添加一个按钮到tabbar中
    UIButton *plusBtn = [[UIButton alloc] init];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    plusBtn.size = plusBtn.currentBackgroundImage.size;
    
    [plusBtn addTarget:self action:@selector(plusClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:plusBtn];
    self.plusBtn = plusBtn;
    
    return self;
}

-(void)plusClick:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(AnnaTabBarDelegate:uiButton:)]) {
        [self.delegate AnnaTabBarDelegate:self uiButton:button];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
#warning 这里是绝对禁止对子类控件确定center时直接使用父类的center.原因的话,应该是父类的center是相对于父类的父控件所言的.直接赋值给子类显然是有问题的
//    self.plusBtn.center = self.center;
;
    
    Class class = NSClassFromString(@"UITabBarButton");
    CGFloat childViewIndex = 0;
    for (UIView *childView in self.subviews) {
        if ([childView isKindOfClass:class]) {
            childView.width = screenWidth / 5;
            childView.x = childViewIndex * screenWidth / 5;
            childViewIndex ++;
            if (childViewIndex == 2) {
                childViewIndex++;
            }
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
