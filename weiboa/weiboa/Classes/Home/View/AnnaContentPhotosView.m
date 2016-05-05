//
//  AnnaContentPhotosView.m
//  weiboa
//
//  Created by Liangkuai on 16/5/5.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaContentPhotosView.h"
#import "AnnaContentPhotoView.h"

#define kStatusPhotoWH 70
#define kStatusPhotoMargin 10
#define kStatusPhotoMaxCol(count) ((count==4)?2:3)

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
            
            int row = i / kStatusPhotoMaxCol(count);
            int column = i % kStatusPhotoMaxCol(count);
            
            CGFloat contentPhotoViewX = column * kStatusPhotoWH + column * kStatusPhotoMargin;
            CGFloat contentPhotoViewY = row * kStatusPhotoWH + row * kStatusPhotoMargin;
            AnnaContentPhotoView *contentPhotoView = (AnnaContentPhotoView *)self.subviews[i];
            contentPhotoView.frame = CGRectMake(contentPhotoViewX, contentPhotoViewY, kStatusPhotoWH, kStatusPhotoWH);
            
//            把数据发送给自定义的contentPhotoView
            contentPhotoView.pictureModel = self.thumbnail_pic[i];
        }
    }
}

@end
