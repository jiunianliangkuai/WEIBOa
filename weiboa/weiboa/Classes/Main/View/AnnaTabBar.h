//
//  AnnaTabBar.h
//  weiboa
//
//  Created by Liangkuai on 16/5/6.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AnnaTabBarDelegate  <UITabBarDelegate>

- (void)AnnaTabBarDelegate:(UITabBar *)tabbar uiButton:(UIButton *)button;

@end

@interface AnnaTabBar : UITabBar

@property (weak, nonatomic)id<AnnaTabBarDelegate>delegate;

@end
