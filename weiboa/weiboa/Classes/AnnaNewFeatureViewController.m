//
//  AnnaNewFeatureViewController.m
//  weiboa
//
//  Created by Liangkuai on 16/5/4.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaNewFeatureViewController.h"
#import "AnnaSwitchRootViewController.h"

#define kCount 4

@interface AnnaNewFeatureViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak)UIScrollView *scrollView;

@property (nonatomic, weak)UIPageControl *pageControl;

@end

@implementation AnnaNewFeatureViewController

- (void)viewDidLoad {
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    [self setupScrollView];
    
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
    
    self.pageControl.numberOfPages = kCount;
//    self.pageControl.center = CGPointMake(self.view.center.x, self.view.height * 7/8);
    self.pageControl.frame = CGRectMake(0, self.view.height * 7/8, screenWidth, 0);
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
}

#pragma mark - 设置页面属性
-(void)setupScrollView{
    _scrollView.frame = screenBounds;
    _scrollView.contentSize = CGSizeMake(kCount * screenWidth, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    
    for (int i = 0; i < kCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",i+1];

        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * screenWidth, 0, screenWidth, screenBounds.size.height);
        [self.scrollView addSubview:imageView];
        
        if (i == kCount - 1) {
            [self setupButton:imageView];
        }
    }
}

#pragma mark - 设置最后一页的按钮
-(void)setupButton:(UIImageView *)imageView{
    imageView.userInteractionEnabled = YES;
    
    UIButton *checkBoxButton = [[UIButton alloc]init];
    [imageView addSubview:checkBoxButton];
    [checkBoxButton setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [checkBoxButton setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [checkBoxButton setTitle:@"分享给大家" forState:UIControlStateNormal];
    [checkBoxButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    checkBoxButton.frame = CGRectMake(0, self.view.height * 2/3, screenWidth, 30);
    
    UIButton *startButton = [[UIButton alloc]init];
    [imageView addSubview:startButton];
    [startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [startButton setTitle:@"进入微博" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    startButton.size = startButton.currentBackgroundImage.size;
    startButton.center = CGPointMake(self.view.center.x, screenBounds.size.height * 4/5);

}

#pragma mark - 监听scrollView的滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.pageControl.currentPage = (NSInteger)(((scrollView.contentOffset.x)/screenWidth) + 0.5);
}

#pragma mark - 进入微博点击事件
- (void)startBtnClick{
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    [AnnaSwitchRootViewController startMainViewController:currentWindow];
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
