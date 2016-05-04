
//
//  AnnaHomeViewController.m
//  weiboa
//
//  Created by Liangkuai on 16/5/2.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaHomeViewController.h"
//UI
#import "AnnaImageLeftButton.h"
#import "AnnaDropMenu.h"

//网络
#import "AnnaAFNTools.h"
#import "MJExtension.h"

//数据模型
#import "AnnaStatusCell.h"
#import "AnnaAccountTools.h"
#import "AnnaAccountModel.h"
#import "AnnaStatusModel.h"
#import "AnnaStatusFrameModel.h"
#import "AnnaUserModel.h"

//扩展
#import "UIBarButtonItem+Extension.h"

//测试
#import "AnnaTestViewController.h"
#import "AnnatestTableViewContoller.h"

@interface AnnaHomeViewController ()<AnnaDropMenuDelegate>

@property (weak, nonatomic)AnnaImageLeftButton *titleBtn;

@property (strong, nonatomic)NSMutableArray *statuses;

@end

@implementation AnnaHomeViewController

-(NSMutableArray *)statuses{
    if (!_statuses) {
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[AnnaStatusCell class] forCellReuseIdentifier:@"identifier"];
    
    [self getUserInfo];
    
    [self setupNavigationTitle];

    [self getNewData];
}


#pragma mark - 设置标题栏
- (void)setupNavigationTitle{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    AnnaImageLeftButton * titleBtn = [AnnaImageLeftButton buttonWithImage:[UIImage imageNamed:@"navigationbar_arrow_up"] selectedImage:[UIImage imageNamed:@"navigationbar_arrow_down"] title:@"首页" font:[UIFont systemFontOfSize:15]];
    titleBtn.selectedImageAnimated = YES;
    [titleBtn addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleBtn;
    self.titleBtn = titleBtn;
}


#pragma mark - 标题按钮的点击事件
- (void)friendSearch{
    AnnaTestViewController *testViewController = [[AnnaTestViewController alloc]init];
    [self.navigationController pushViewController:testViewController animated:YES];
}

- (void)pop{
}

/**
 *  titleView点击事件
 */
- (void)titleButtonClick:(AnnaImageLeftButton *)btn{
    
    btn.selected = YES;
    AnnaDropMenu *dropMenu = [AnnaDropMenu dropMenu];
    dropMenu.delegate = self;
    dropMenu.contentController = [[AnnatestTableViewContoller alloc]init];
    [dropMenu addOn:btn];
    [dropMenu show];
}


#pragma mark - 下拉菜单代理方法
-(void)dropMenuDelegateDropMenu:(AnnaDropMenu *)dropMenu{
    self.titleBtn.selected = NO;
}


#pragma mark - 获取用户数据
-(void)getUserInfo{
    
    AnnaAccountModel *accountModel = [AnnaAccountTools loadAccount];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"access_token"] = accountModel.access_token;
    param[@"uid"] = accountModel.uid;
    [AnnaAFNTools AFNToolsGETWithURL:@"https://api.weibo.com/2/users/show.json" parameters:param success:^(NSDictionary * responseObject) {
        
        [accountModel setKeyValues:responseObject];
        [AnnaAccountTools saveAccount:accountModel];
        
        UIButton *titleBtn = (UIButton *)self.navigationItem.titleView;
        [titleBtn setTitle:accountModel.name forState:UIControlStateNormal];
    } failure:^(NSError *error) {
        AnnaLog(@"%@",error);
    }];
}


#pragma mark - 获取最新的微博
-(void)getNewData{
    AnnaAccountModel *accountModel = [AnnaAccountTools loadAccount];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = accountModel.access_token;
    
    [AnnaAFNTools AFNToolsGETWithURL:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:params success:^(NSDictionary * responseObject) {
        NSArray *temp= [AnnaStatusModel objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        
        NSMutableArray *mutArr = [NSMutableArray array];
        for (AnnaStatusModel *statusModel in temp) {
            AnnaStatusFrameModel *statusFrameModel = [[AnnaStatusFrameModel alloc]init];
            statusFrameModel.statusModel = statusModel;
            [mutArr addObject:statusFrameModel];
        }
        
        NSRange range ;
        range.length = temp.count;
        range.location = 0;
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.statuses insertObjects:mutArr atIndexes:indexSet];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark - tableView的数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AnnaStatusFrameModel *statusFrameModel = self.statuses[indexPath.row];
    
    AnnaStatusCell *cell = [AnnaStatusCell statusCellWithTableView:tableView];
    
    cell.statusFrameModel = statusFrameModel;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.statuses[indexPath.row] cellHeight];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
