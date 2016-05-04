
//
//  AnnaMainTabbarController.m
//  weiboa
//
//  Created by Liangkuai on 16/5/2.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaMainTabbarController.h"
#import "AnnaHomeViewController.h"
#import "AnnaMessageViewController.h"
#import "AnnaDiscoverViewController.h"
#import "AnnaProfileViewController.h"

#import "AnnaNavViewController.h"

@interface AnnaMainTabbarController ()

@end

@implementation AnnaMainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    AnnaHomeViewController *homeViewController = [[AnnaHomeViewController alloc]init];
    [self addChildViewController:homeViewController WithTitle:@"主页" ImageName:@"tabbar_home" SelectedImage:@"tabbar_home_selected"];
    
    AnnaMessageViewController *messageViewController = [[AnnaMessageViewController alloc]init];
    [self addChildViewController:messageViewController WithTitle:@"私信" ImageName:@"tabbar_message_center" SelectedImage:@"tabbar_message_center_selected"];
    
    AnnaDiscoverViewController *discoverViewController = [[AnnaDiscoverViewController alloc]init];
    [self addChildViewController:discoverViewController WithTitle:@"发现" ImageName:@"tabbar_discover" SelectedImage:@"tabbar_discover_selected"];
    
    AnnaProfileViewController *profileViewController = [[AnnaProfileViewController alloc]init];
    [self addChildViewController:profileViewController WithTitle:@"我" ImageName:@"tabbar_profile" SelectedImage:@"tabbar_profile_selected"];
    
}

- (void)addChildViewController:(UIViewController *)childController WithTitle:(NSString *)title ImageName:(NSString *)imageName SelectedImage:(NSString *)selectedImageName{
    
    AnnaNavViewController *navViewController  = [[AnnaNavViewController alloc]initWithRootViewController:childController];

    
    childController.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:imageName] selectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [childController.tabBarItem setTitleTextAttributes:attr forState:UIControlStateSelected];

    
    [self addChildViewController:navViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
