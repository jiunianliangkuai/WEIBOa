//
//  AnnaAccountTools.h
//  weiboa
//
//  Created by Liangkuai on 16/5/3.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AnnaAccountModel;

@interface AnnaAccountTools : NSObject

+(void)saveAccount:(AnnaAccountModel *)accountModel;

+(AnnaAccountModel *)loadAccount;
@end
