
//
//  AnnaAccountTools.m
//  weiboa
//
//  Created by Liangkuai on 16/5/3.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//
#import "AnnaAccountTools.h"
#import "AnnaAccountModel.h"


#define filePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation AnnaAccountTools

+(void)saveAccount:(AnnaAccountModel *)accountModel{
    [NSKeyedArchiver archiveRootObject:accountModel toFile:filePath];
}

+(AnnaAccountModel *)loadAccount{
    AnnaAccountModel *accountModel = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return accountModel;
}

@end
