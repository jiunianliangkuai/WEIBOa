//
//  AnnaSwitchRootViewController.h
//  weiboa
//
//  Created by Liangkuai on 16/5/4.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnnaSwitchRootViewController : NSObject

//提供选择并且切换根控制器的方法给appdelegate
+ (void)switchViewController:(UIWindow *)window;

+ (void)updateSwitch:(UIWindow *)window;

//提供直接切换根控制器的方法给新特性控制器跳转
+(void)startMainViewController:(UIWindow *)window;
@end
