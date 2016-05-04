//
//  AnnaAFNTools.m
//  weiboa
//
//  Created by Liangkuai on 16/5/3.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaAFNTools.h"
#import "AFNetworking.h"
@implementation AnnaAFNTools

/**
 *  发送POST请求
 *
 *  @param url     链接
 *  @param param   参数
 *  @param success 成功block
 *  @param failure 失败block
 */
+ (void)AFNToolsPOSTWithURL:(NSString *)url parameters:(id)param success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    //    (void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    
    [mgr POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

/**
 *  发送GET请求
 *
 *  @param url     链接
 *  @param param   参数
 *  @param success 成功block
 *  @param failure 失败block
 */
+ (void)AFNToolsGETWithURL:(NSString *)url parameters:(id)param success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    //    (void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    
    [mgr GET:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}



@end
