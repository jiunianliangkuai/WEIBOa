//
//  AnnaSwitchRootViewController.m
//  weiboa
//
//  Created by Liangkuai on 16/5/4.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaSwitchRootViewController.h"
#import "AnnaMainTabbarController.h"
#import "AnnaLoginViewController.h"
#import "AnnaNewFeatureViewController.h"

#import "AnnaAccountTools.h"

@implementation AnnaSwitchRootViewController

+ (void)switchViewController:(UIWindow *)window{
    if ([AnnaAccountTools loadAccount]) {
        [self updateSwitch:window];
    } else {
        AnnaLoginViewController *loginViewController = [[AnnaLoginViewController alloc] init];
        window.rootViewController = loginViewController;
    }
}

+ (void)updateSwitch:(UIWindow *)window{
    
    NSString *key = @"CFBundleVersion";
    // 上一次的使用版本（存储在沙盒中的版本号）
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    // 当前软件的版本号（从Info.plist中获得）
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) { // 版本号相同：这次打开和上次打开的是同一个版本
        [self startMainViewController:window];
    } else { // 这次打开的版本和上一次不一样，显示新特性
        AnnaNewFeatureViewController *newFeatureViewController = [[AnnaNewFeatureViewController alloc]init];
        // 将当前的版本号存进沙盒
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        window.rootViewController = newFeatureViewController;
    }
}

+(void)startMainViewController :(UIWindow *)window{
    AnnaMainTabbarController *mainTabbarController = [[AnnaMainTabbarController alloc]init];
    window.rootViewController = mainTabbarController;
}

@end
