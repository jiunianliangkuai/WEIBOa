//
//  AnnaStatusModel.h
//  weiboa
//
//  Created by Liangkuai on 16/5/4.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnnaUserModel.h"
@class AnnaStatusModel;

@interface AnnaStatusModel : NSObject
/**
 *  微博的id
 */
@property (nonatomic, copy) NSString *idstr;

/**
 *  微博文本
 */
@property (nonatomic, copy) NSString *text;

/**
 *  来源
 */
@property (nonatomic, copy) NSString *source;

/**
 *  创建时间
 */
@property (nonatomic ,copy) NSString *created_at;

/**
 *  微博作者的具体信息
 */
@property (strong, nonatomic) AnnaUserModel *user;


/** 微博配图地址。多图时返回多图链接。无配图返回“[]” */
@property (nonatomic, strong) NSArray *pic_urls;

/** 被转发的原微博信息字段，当该微博为转发微博时返回 */
@property (nonatomic, strong) AnnaStatusModel *retweeted_status;

/**	int	转发数*/
@property (nonatomic, assign) int reposts_count;
/**	int	评论数*/
@property (nonatomic, assign) int comments_count;
/**	int	表态数*/
@property (nonatomic, assign) int attitudes_count;


@end
