//
//  AnnaNavViewController.m
//  weiboa
//
//  Created by Liangkuai on 16/5/2.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaNavViewController.h"
#import "UIBarButtonItem+Extension.h"



@interface AnnaNavViewController ()

@end

@implementation AnnaNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 截取控制器来设置主控制器以后的小控制器的navigationbar
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    
    if (viewController) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftButtonClick) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
                                                           
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightButtonClick) image:@"navigationbar_more" highImage:@"navigation_more_highlighted"];
    }
}


#pragma mark - 点击事件
- (void)leftButtonClick{
    [self popViewControllerAnimated:YES];
}

- (void)rightButtonClick{
    [self popToRootViewControllerAnimated:YES];
}

//
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}


@end
