//
//  AnnaComposeViewController.m
//  weiboa
//
//  Created by Liangkuai on 16/5/6.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaComposeViewController.h"
#import "AnnaAccountTools.h"
#import "AnnaAccountModel.h"

@interface AnnaComposeViewController ()

@end

@implementation AnnaComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupNav];
    
    [self setupTextView];
}

#pragma mark - 设置navtitle
- (void)setupNav{
    
//    设置左侧取消按钮
#warning 这里的文字颜色问题还没有解决.可以想到的方法只有用uibutton来代替而已
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor orangeColor];
//    设置右侧发送按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor orangeColor];

    self.navigationItem.rightBarButtonItem.enabled = NO;
    
/*    用文本属性的方法似乎没有直接设置文本颜色好用
//    属性字典
//    NSDictionary *attrHighlightDict = [NSDictionary dictionaryWithObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName];
//    NSDictionary *attrNormDict = [NSDictionary dictionaryWithObject:[UIColor orangeColor] forKey:NSForegroundColorAttributeName];

//    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:attrHighlightDict forState:UIControlStateHighlighted];
//    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:attrNormDict forState:UIControlStateNormal];
//
//    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attrHighlightDict forState:UIControlStateHighlighted];
//    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attrNormDict forState:UIControlStateNormal];
//    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attrNormDict forState:UIControlStateDisabled];
*/
//    设置中间的title
    AnnaAccountModel *accountModel = [AnnaAccountTools loadAccount];
    [self weiboTitleViewWithAccount:accountModel];
    self.navigationItem.titleView = [self weiboTitleViewWithAccount:accountModel];
}

-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)setupTextView{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - navi的titleview的特殊实现方法,提供两个.一个是官方微博风格,一个是weico风格
-(UIView *)weiboTitleViewWithAccount:(AnnaAccountModel *)accountModel{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];

    NSString *name = [NSString stringWithFormat:accountModel.name];
    NSString *send = [NSString stringWithFormat:@"发微博"];
    NSString *titleString = [NSString stringWithFormat:@"%@\n%@",send,name];
    
    NSMutableAttributedString *mutAttrString = [[NSMutableAttributedString alloc]initWithString:titleString];

//    发微博文字部分
    [mutAttrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, send.length)];
//    用户名部分
    [mutAttrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(send.length, name.length)];
    
    titleLabel.attributedText = mutAttrString;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;
    return titleLabel;
}

- (UIView *)weicoTitleViewWithAccount:(AnnaAccountModel *)accountModel{
    UIImageView *iconImageView = [[UIImageView alloc]init];
    
//    iconImageView.image = [UIImageView ];
    return iconImageView;
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
