//
//  AnnaAFNTools.h
//  weiboa
//
//  Created by Liangkuai on 16/5/3.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnnaAFNTools : NSObject

+ (void)AFNToolsGETWithURL:(NSString *)url parameters:(id)param success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

+ (void)AFNToolsPOSTWithURL:(NSString *)url parameters:(id)param success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

@end
