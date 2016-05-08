//
//  AnnaStatusFrameModel.h
//  weiboa
//
//  Created by Liangkuai on 16/5/4.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kMargin 10

#define nameLabelFont [UIFont systemFontOfSize:13]

#define sourceLabelFont [UIFont systemFontOfSize:11]

#define timeLabelFont [UIFont systemFontOfSize:11]

#define contentLabelFont [UIFont systemFontOfSize:14]


@class AnnaStatusModel;

@interface AnnaStatusFrameModel : NSObject

@property (strong, nonatomic)AnnaStatusModel *statusModel;


@property (assign, nonatomic)CGRect originViewFrame;

@property (assign, nonatomic)CGRect iconImageViewFrame;

@property (assign, nonatomic)CGRect nameLabelFrame;

@property (assign, nonatomic)CGRect vipImageViewFrame;

@property (assign, nonatomic)CGRect contentLabelFrame;

@property (assign, nonatomic)CGRect contentPhotosViewFrame;

/** 转发微博整体 */
@property (nonatomic, assign) CGRect retweetViewFrame;
/** 转发微博正文 + 昵称 */
@property (nonatomic, assign) CGRect retweetContentLabelFrame;
/** 转发配图 */
@property (nonatomic, assign) CGRect retweetPhotosViewFrame;


@property (nonatomic, assign) CGRect statusToolsBarFrame;

@property (assign, nonatomic)CGFloat cellHeight;


@end
