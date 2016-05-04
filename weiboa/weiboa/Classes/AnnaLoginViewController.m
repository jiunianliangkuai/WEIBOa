//
//  AnnaLoginViewController.m
//  weiboa
//
//  Created by Liangkuai on 16/5/3.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaLoginViewController.h"
#import "AnnaAFNTools.h"
#import "AnnaConst.h"
#import "AnnaAccountModel.h"
#import "AnnaAccountTools.h"
#import "AnnaSwitchRootViewController.h"
#import "MJExtension.h"
#define AppKey @"4074196853"
#define redirectURL @"http://www.baidu.com"

@interface AnnaLoginViewController ()<UIWebViewDelegate>

@property(weak, nonatomic)UIWebView *webView;

@end

@implementation AnnaLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = screenBounds;
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:screenBounds];
    self.webView = webView;
    [self.view addSubview:webView];
    webView.delegate = self;

    [self login]; 
    
}


#pragma mark - 登录
-(void)login{
    
    NSMutableString *urlString = [NSMutableString string];
    [urlString appendFormat:@"https://api.weibo.com/oauth2/authorize"];
    [urlString appendFormat:@"?"];
    [urlString appendFormat:@"client_id=%@",AnnaAppKey];
    [urlString appendFormat:@"&"];
    [urlString appendFormat:@"redirect_uri=%@",AnnaRedirectURL];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}

#pragma mark - webView的监控方法
-(void)webViewDidStartLoad:(UIWebView *)webView{
}


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    // 1.获得url
    NSString *url = request.URL.absoluteString;
    
    // 2.判断是否为回调地址
    NSRange range = [url rangeOfString:@"code="];
    if (range.length != 0) { // 是回调地址
        // 截取code=后面的参数值
        NSUInteger fromIndex = range.location + range.length;
        NSString *code = [url substringFromIndex:fromIndex];
        
        // 利用code换取一个accessToken
        [self accessTokenWithCode:code];
        
        // 禁止加载回调地址
        return NO;
    }
    
    return YES;

}

- (void)accessTokenWithCode:(NSString *)code{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = AnnaAppKey;
    params[@"client_secret"] = @"f72ba2d8a3bcb8fbb1d289fa3d0375b3";
    params[@"grant_type"] = @"authorization_code";
    params[@"redirect_uri"] = AnnaRedirectURL;
    params[@"code"] = code;
    [AnnaAFNTools AFNToolsPOSTWithURL:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(NSDictionary * responseObject) {
//        切换根控制器
        [self resignFirstResponder];
        UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
        [AnnaSwitchRootViewController updateSwitch:currentWindow];
//        存储账户信息
        AnnaAccountModel *accountModel = [[AnnaAccountModel alloc]init];
        [accountModel setKeyValues:responseObject];
        [AnnaAccountTools saveAccount:accountModel];
        
    } failure:^(NSError *error) {
        AnnaLog(@"%@",error);
    }];
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
