//
//  AnnaDetailWeiboController.m
//  weiboa
//
//  Created by Liangkuai on 16/5/8.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#warning 因为只有授权用户才能获取得到微博的具体数据.所以这个类基本不能够使用

#import "AnnaDetailWeiboController.h"
#import "AnnaStatusModel.h"
#import "AnnaAccountModel.h"
#import "AnnaAccountTools.h"
#import "AnnaAFNTools.h"
@interface AnnaDetailWeiboController ()

@end

@implementation AnnaDetailWeiboController

#pragma mark - 类方法
+ (instancetype)detailWeiboControllerWithStatusModel: (AnnaStatusModel *)statusModel{
    AnnaDetailWeiboController *detailWeiboController = [[AnnaDetailWeiboController alloc]init];
    
    detailWeiboController.statusModel = statusModel;
    
    return detailWeiboController;
}

-(void)setStatusModel:(AnnaStatusModel *)statusModel{
    _statusModel = statusModel;
    
    [self getDetailWeibo];
}

- (void)getDetailWeibo{
    
//    取出模型
    AnnaAccountModel *accountModel = [AnnaAccountTools loadAccount];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"id"] = self.statusModel.idstr;
    
    params[@"access_token"] = accountModel.access_token;
    
    [AnnaAFNTools AFNToolsGETWithURL:@"https://api.weibo.com/2/statuses/show.json" parameters:params success:^(NSDictionary * responseObject) {
        AnnaLog(@"%@",responseObject);
    } failure:^(NSError *error) {
        AnnaLog(@"error===================%@",error);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
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
