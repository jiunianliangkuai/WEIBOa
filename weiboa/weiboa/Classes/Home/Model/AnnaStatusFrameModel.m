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

#define kStatusPhotoWH 70
#define kStatusPhotoMargin 10
#define kStatusPhotoMaxCol(count) ((count==4)?2:3)

@implementation AnnaStatusFrameModel
-(void)setStatusModel:(AnnaStatusModel *)statusModel{
    _statusModel = statusModel;
    AnnaUserModel *userModel = statusModel.user;
    
//    计算frame
//    头像的frame
    CGFloat iconImageViewX = kMargin;
    CGFloat iconImageViewY = kMargin;
    CGFloat iconImageViewWidth = 50;
    CGFloat iconImageViewHeight = 50;
    self.iconImageViewFrame = CGRectMake(iconImageViewX, iconImageViewY, iconImageViewWidth, iconImageViewHeight);

//    nameLabel的frame
    CGFloat nameLabelX = CGRectGetMaxX(_iconImageViewFrame) + kMargin;
    CGFloat nameLabelY = iconImageViewY;
    CGSize nameLabelSize = [userModel.name sizeWithFont:nameLabelFont maxW:MAXFLOAT];
    self.nameLabelFrame = (CGRect){{nameLabelX, nameLabelY},nameLabelSize};
    
//    vip的frame
    CGFloat vipImageViewX = CGRectGetMaxX(_nameLabelFrame) + kMargin;
    CGFloat vipImageViewY = nameLabelY;
    CGFloat vipImageViewWidth = vipImageViewWH;
    CGFloat vipImageViewHeight = vipImageViewWH;
    self.vipImageViewFrame = CGRectMake(vipImageViewX, vipImageViewY, vipImageViewWidth, vipImageViewHeight);
    
//    计算timeLabel的frame
    CGFloat timeLabelX = nameLabelX;
    CGFloat timeLabelY = CGRectGetMaxY(_nameLabelFrame) + kMargin + kMargin;
    CGSize timeLabelSize = [statusModel.created_at sizeWithFont:timeLabelFont];

    self.timeLabelFrame = (CGRect){{timeLabelX, timeLabelY},timeLabelSize};
    
//    计算sourceLabel的frame
    CGFloat sourceLabelX = CGRectGetMaxX(_timeLabelFrame) + kMargin;
    CGFloat sourceLabelY = timeLabelY;
    CGSize sourceLabelSize = [statusModel.sourceLabelText sizeWithFont:sourceLabelFont];
    self.sourceLabelFrame = (CGRect){{sourceLabelX, sourceLabelY},sourceLabelSize};
    
//    计算微博正文的frame
    CGFloat contentLabelX = kMargin;
    CGFloat contentLabelY = MAX(CGRectGetMaxY(_iconImageViewFrame) + kMargin, CGRectGetMaxY(_timeLabelFrame) + kMargin);
    CGFloat contentLabelMaxWidth = screenWidth - 2 * kMargin;
    CGSize contengLabelSize = [statusModel.text sizeWithFont:contentLabelFont maxW:contentLabelMaxWidth];
    self.contentLabelFrame = (CGRect){{contentLabelX, contentLabelY},contengLabelSize};
    
//    计算微博配图的frame
    CGFloat contentPhotosViewX = kMargin;
    CGFloat contentPhotosViewY = CGRectGetMaxY(_contentLabelFrame) + kMargin;
    CGSize contentPhotosViewSize = [AnnaStatusFrameModel sizeWithCount:statusModel.pic_urls.count];
    self.contentPhotosViewFrame = (CGRect){{contentPhotosViewX, contentPhotosViewY}, contentPhotosViewSize};
    
//    计算总原创微博的frame
    CGFloat originViewX = 0;
    CGFloat originViewY = 0;
    CGFloat originViewWidth = screenWidth;
    CGFloat originViewHeight = MAX(CGRectGetMaxY(_contentLabelFrame), CGRectGetMaxY(_contentPhotosViewFrame)) + kMargin;
    
    self.originViewFrame = CGRectMake(originViewX, originViewY, originViewWidth, originViewHeight);
    
//    行高
    self.cellHeight = originViewHeight + kMargin;
}


#warning 这里教学中把这个方法方法photosView里面去.但好像放在这里也没什么不可以....
/**
 *  通过配图数量计算其frame
 *
 *  @param count 图片数量
 */
+ (CGSize)sizeWithCount:(NSUInteger)count
{
    if (!count) {
        return CGSizeZero;
    }
    // 最大列数（一行最多有多少列）
    int maxCols = kStatusPhotoMaxCol(count);
    
    ///Users/apple/Desktop/课堂共享/05-iPhone项目/1018/代码/黑马微博2期35-相册/黑马微博2期/Classes/Home(首页)/View/HWStatusPhotosView.m 列数
    NSUInteger cols = (count >= maxCols)? maxCols : count;
    CGFloat photosW = cols * kStatusPhotoWH + (cols - 1) * kStatusPhotoMargin;
    
    // 行数
    NSUInteger rows = (count + maxCols - 1) / maxCols;
    CGFloat photosH = rows * kStatusPhotoWH + (rows - 1) * kStatusPhotoMargin;
    return CGSizeMake(photosW, photosH);
}

@end
