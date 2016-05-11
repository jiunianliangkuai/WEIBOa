//
//  AnnaDropMenu.m
//  weiboa
//
//  Created by Liangkuai on 16/5/3.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaDropMenu.h"
#import "AnnaWeiboGroupController.h"
@interface AnnaDropMenu ()

@property (weak, nonatomic)UIImageView *menuView;

@end

@implementation AnnaDropMenu

#pragma mark - 实例化
+(instancetype)dropMenu{
    UIWindow *currentWindow = [[UIApplication sharedApplication].windows lastObject];
    
    AnnaDropMenu *dropMenu = [[AnnaDropMenu alloc]init];
    dropMenu.alpha = 0;

    [currentWindow addSubview:dropMenu];
    dropMenu.frame = screenBounds;
    dropMenu.backgroundColor = [UIColor clearColor];
    
    UIImageView *menuView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"popover_background"]];
    menuView.userInteractionEnabled = YES;
    dropMenu.menuView = menuView;
    [dropMenu addSubview:menuView];
    
    return dropMenu;
}

/**
 *  添加位置
 */
-(void)addOn:(UIView *)targetView{
    UIWindow *currentWindow = [[UIApplication sharedApplication].windows lastObject];
//    self.menuView.frame = CGRectMake(40, 40, 217, 300);
    self.menuView.size = CGSizeMake(217, 300);
    CGRect realRect = [targetView convertRect:targetView.bounds toView:currentWindow];
    
    self.menuView.y = CGRectGetMaxY(realRect);
    self.menuView.centerX = CGRectGetMidX(realRect);
    AnnaLog(@"%f",CGRectGetMidX(realRect));
    AnnaLog(@"%@",NSStringFromCGRect(self.menuView.frame));
}

#pragma mark - 数据方法
-(void)setContentController:(AnnaWeiboGroupController *)contentController{
    _contentController = contentController;
    contentController.delegate = self;
    CGFloat horizonMargin = 8;
    CGFloat topMarin = 15;
    
    CGFloat contentX = horizonMargin;
    CGFloat contentY = topMarin;
    CGFloat contentWidth = self.menuView.width - 2 * horizonMargin;
    CGFloat contentHeight = self.menuView.height - 2 * topMarin;
    
    CGRect contentRect = CGRectMake(contentX , contentY,contentWidth , contentHeight);
    contentController.view.frame = contentRect;
    [self.menuView addSubview:contentController.view];
    
}

#pragma mark - 数据源的代理方法
- (void)weiboGroupControllerDidSelectGroup:(AnnaWeiboGroupType)type{
    if ([self.delegate respondsToSelector:@selector(dropMenuDelegateDropMenu:WithGroupType:)]) {
        [self.delegate dropMenuDelegateDropMenu:self WithGroupType:type];
    }
    [self dismiss];
    
}

#pragma mark - 显示和隐藏方法
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(dropMenuDelegateDropMenu:WithGroupType:)]) {
        [self.delegate dropMenuDelegateDropMenu:self WithGroupType:AnnaWeiboGroupTypeNotSelect];
    }
    [self dismiss];
    
}

-(void)show{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
    }];
}

-(void)dismiss{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    }];
    self.contentController = nil;
}


#pragma mark - 销毁方法
-(void)dealloc{
    AnnaLog(@"DropMenuView Dealloc");
}
@end
