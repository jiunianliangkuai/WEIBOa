//
//  AnnaStatusFrameModel.m
//  weiboa
//
//  Created by Liangkuai on 16/5/4.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaStatusFrameModel.h"
#import "NSString+Extension.h"
#import "AnnaUserModel.h"
#import "AnnaStatusModel.h"

#define kMargin 10
#define vipImageViewWH 15

@implementation AnnaStatusFrameModel
-(void)setStatusModel:(AnnaStatusModel *)statusModel{
    _statusModel = statusModel;
    AnnaUserModel *userModel = statusModel.user;
    
//    计算frame
    CGFloat iconImageViewX = kMargin;
    CGFloat iconImageViewY = kMargin;
    CGFloat iconImageViewWidth = 50;
    CGFloat iconImageViewHeight = 50;
    self.iconImageViewFrame = CGRectMake(iconImageViewX, iconImageViewY, iconImageViewWidth, iconImageViewHeight);

    CGFloat nameLabelX = CGRectGetMaxX(_iconImageViewFrame) + kMargin;
    CGFloat nameLabelY = iconImageViewY;
    CGSize nameLabelSize = [userModel.name sizeWithFont:nameLabelFont maxW:MAXFLOAT];
    self.nameLabelFrame = (CGRect){{nameLabelX, nameLabelY},nameLabelSize};
    
    if (statusModel.user.isVip) {
        CGFloat vipImageViewX = CGRectGetMaxX(_nameLabelFrame) + kMargin;
        CGFloat vipImageViewY = nameLabelY;
        CGFloat vipImageViewWidth = vipImageViewWH;
        CGFloat vipImageViewHeight = vipImageViewWH;
        self.vipImageViewFrame = CGRectMake(vipImageViewX, vipImageViewY, vipImageViewWidth, vipImageViewHeight);
    } else {
        self.vipImageViewFrame = CGRectZero;
    }

    
    CGFloat timeLabelX = nameLabelX;
    CGFloat timeLabelY = CGRectGetMaxY(_nameLabelFrame) + kMargin + kMargin;
    CGSize timeLabelSize = [statusModel.created_at sizeWithFont:timeLabelFont];

    self.timeLabelFrame = (CGRect){{timeLabelX, timeLabelY},timeLabelSize};
    
    CGFloat sourceLabelX = CGRectGetMaxX(_timeLabelFrame) + kMargin;
    CGFloat sourceLabelY = timeLabelY;
    CGSize sourceLabelSize = [statusModel.sourceLabelText sizeWithFont:sourceLabelFont];
    self.sourceLabelFrame = (CGRect){{sourceLabelX, sourceLabelY},sourceLabelSize};
    
    CGFloat contentLabelX = kMargin;
    CGFloat contentLabelY = MAX(CGRectGetMaxY(_iconImageViewFrame) + kMargin, CGRectGetMaxY(_timeLabelFrame) + kMargin);
    CGFloat contentLabelMaxWidth = screenWidth - 2 * kMargin;
    CGSize contengLabelSize = [statusModel.text sizeWithFont:contentLabelFont maxW:contentLabelMaxWidth];
    self.contentLabelFrame = (CGRect){{contentLabelX, contentLabelY},contengLabelSize};
    
    AnnaLog(@"%@",statusModel.pic_urls);
    AnnaLog(@"\n\n\n");
    self.cellHeight = 300;
}
@end
