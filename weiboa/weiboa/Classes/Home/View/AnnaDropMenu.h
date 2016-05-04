//
//  AnnaDropMenu.h
//  weiboa
//
//  Created by Liangkuai on 16/5/3.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnnaDropMenu;

@protocol AnnaDropMenuDelegate <NSObject>

- (void)dropMenuDelegateDropMenu:(AnnaDropMenu *)dropMenu;

@end

@interface AnnaDropMenu : UIView

+(instancetype)dropMenu;

@property (strong, nonatomic)UIViewController *contentController;

@property (weak, nonatomic)id<AnnaDropMenuDelegate> delegate;

-(void)addOn:(UIView *)targetView;

-(void)show;

-(void)dismiss;
@end
