//
//  AnnaContentPhotosView.m
//  weiboa
//
//  Created by Liangkuai on 16/5/5.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaContentPhotosView.h"
#import "AnnaContentPhotoView.h"

#define kContentPhotoWH 70
#define kContentPhotoMargin 10
#warning 相当高明的写法
#define kContentPhotoMaxCol(count) ((count==4)?2:3)

@interface AnnaContentPhotosView ()

@property (weak, nonatomic)AnnaContentPhotoView *contentPhotoView;

@end

@implementation AnnaContentPhotosView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.userInteractionEnabled = YES;
    return self;
}

-(void)setThumbnail_pic:(NSArray *)thumbnail_pic{
    _thumbnail_pic = thumbnail_pic;
    if (self.subviews.count) {
        
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    for (int i = 0; i < self.thumbnail_pic.count; i++ ) {
        AnnaContentPhotoView *contentPhotoView = [[AnnaContentPhotoView alloc]init];
        contentPhotoView.pictureModel = self.thumbnail_pic[i];
        [self addSubview:contentPhotoView];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.thumbnail_pic.count) {
        NSInteger count = self.thumbnail_pic.count;
        
        for (int i = 0; i < self.subviews.count; i++ ) {
            
            int row = i / kContentPhotoMaxCol(count);
            int column = i % kContentPhotoMaxCol(count);
            
            CGFloat contentPhotoViewX = column * kContentPhotoWH + column * kContentPhotoMargin;
            CGFloat contentPhotoViewY = row * kContentPhotoWH + row * kContentPhotoMargin;
            AnnaContentPhotoView *contentPhotoView = (AnnaContentPhotoView *)self.subviews[i];
            contentPhotoView.frame = CGRectMake(contentPhotoViewX, contentPhotoViewY, kContentPhotoWH, kContentPhotoWH);
            
//            把数据发送给自定义的contentPhotoView
            contentPhotoView.pictureModel = self.thumbnail_pic[i];
        }
    }
}

#warning 这里教学中把这个方法方法photosView里面去.但好像放在Frame模型中也没什么不可以....
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
    int maxCols = kContentPhotoMaxCol(count);
    
    ///Users/apple/Desktop/课堂共享/05-iPhone项目/1018/代码/黑马微博2期35-相册/黑马微博2期/Classes/Home(首页)/View/HWStatusPhotosView.m 列数
    NSUInteger cols = (count >= maxCols)? maxCols : count;
    CGFloat photosW = cols * kContentPhotoWH + (cols - 1) * kContentPhotoMargin;
    
    // 行数
    NSUInteger rows = (count + maxCols - 1) / maxCols;
    CGFloat photosH = rows * kContentPhotoWH + (rows - 1) * kContentPhotoMargin;
    return CGSizeMake(photosW, photosH);
}
@end
