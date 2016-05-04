//
//  AnnaStatusFrameModel.m
//  weiboa
//
//  Created by Liangkuai on 16/5/4.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaStatusFrameModel.h"
#define kMargin 10

@implementation AnnaStatusFrameModel
-(void)setStatusModel:(AnnaStatusModel *)statusModel{
    _statusModel = statusModel;
    
//    计算frame
    CGFloat iconImageViewX = kMargin;
    CGFloat iconImageViewY = kMargin;
    CGFloat iconImageViewWidth = 70;
    CGFloat iconImageViewHeight = 70;
    self.iconImageViewFrame = CGRectMake(iconImageViewX, iconImageViewY, iconImageViewWidth, iconImageViewHeight);






    self.cellHeight = 300;
}
@end
