//
//  AnnaStatusContentPhotosView.h
//  weiboa
//
//  Created by Liangkuai on 16/5/5.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnnaContentPhotosView : UIView

@property (strong, nonatomic)NSArray *thumbnail_pic;

+ (CGSize)sizeWithCount:(NSUInteger)count;

@end
