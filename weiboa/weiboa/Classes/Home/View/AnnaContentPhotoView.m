//
//  AnnaContentPhotoView.m
//  weiboa
//
//  Created by Liangkuai on 16/5/5.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaContentPhotoView.h"
#import "AnnaStatusPictureModel.h"
#import "UIImageView+WebCache.h"

@implementation AnnaContentPhotoView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.userInteractionEnabled = YES;
    self.image = [UIImage imageNamed:@"tabbar_compose_button"];
    
    return self;
}

-(void)setPictureModel:(AnnaStatusPictureModel *)pictureModel{
    _pictureModel = pictureModel;
    [self sd_setImageWithURL:[NSURL URLWithString:pictureModel.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
}
@end
