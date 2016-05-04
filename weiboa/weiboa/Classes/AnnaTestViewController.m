//
//  AnnaTestViewController.m
//  weiboa
//
//  Created by Liangkuai on 16/5/3.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaTestViewController.h"

@interface AnnaTestViewController ()

@end

@implementation AnnaTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *testButon = [[UIButton alloc]initWithFrame:CGRectMake(30, 70, 39, 39)];
    [self.view addSubview:testButon];
    [testButon setImage:[UIImage imageNamed:@"app"] forState:UIControlStateNormal];
    [testButon addTarget:self action:@selector(testPop) forControlEvents:UIControlEventTouchDown];
}

-(void)testPop{
    AnnaTestViewController *testViewController2 = [[AnnaTestViewController alloc]init];
    [self.navigationController pushViewController:testViewController2 animated:YES];
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
