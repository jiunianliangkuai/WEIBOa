//
//  AnnaDetailWeiboController.h
//  weiboa
//
//  Created by Liangkuai on 16/5/8.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnnaStatusModel;

@interface AnnaDetailWeiboController : UIViewController

@property (strong, nonatomic)AnnaStatusModel *statusModel;

+ (instancetype)detailWeiboControllerWithStatusModel: (AnnaStatusModel *)statusModel;

@end
