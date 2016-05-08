//
//  AnnaAccountModel.h
//  weiboa
//
//  Created by Liangkuai on 16/5/3.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnnaAccountModel : NSObject
/**　string	用于调用access_token，接口获取授权后的access token。*/
@property (nonatomic, copy) NSString *access_token;

/**　string	access_token的生命周期，单位是秒数。*/
@property (nonatomic, copy) NSNumber *expires_in;

/**　string	当前授权用户的UID。*/
@property (nonatomic, copy) NSString *uid;

/**	access token的创建时间 */
@property (nonatomic, strong) NSDate *created_time;

/** 用户的昵称 */
@property (nonatomic, copy) NSString *name;

/** 用户头像地址 */
@property (nonatomic, strong)NSString *profile_image_url;

/** 用户头像数据 */
@property (nonatomic, strong)NSString *iconBase64;

@end
