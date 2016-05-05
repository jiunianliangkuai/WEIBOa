
//
//  AnnaStatusCell.m
//  weiboa
//
//  Created by Liangkuai on 16/5/4.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaStatusCell.h"
#import "AnnaUserModel.h"
#import "AnnaStatusModel.h"

#import "AnnaContentPhotosView.h"
#import "NSString+Extension.h"
#import "AnnaStatusFrameModel.h"
#import "UIImageView+WebCache.h"

@interface AnnaStatusCell ()
/** 原创微博整体 */
@property (weak, nonatomic)UIView *originView;

@property (weak, nonatomic)UIImageView *iconImageView;

@property (weak, nonatomic)UILabel *nameLabel;

@property (weak, nonatomic)UIImageView *vipImageView;

@property (weak, nonatomic)UILabel *timeLabel;

@property (weak, nonatomic)UILabel *sourceLabel;

@property (weak, nonatomic)UILabel *contentLabel;

@property (weak, nonatomic)AnnaContentPhotosView *contentPhotosView;


/** 转发微博整体 */
@property (nonatomic, weak) UIView * retweetView;
/** 转发微博正文 + 昵称 */
@property (nonatomic, weak) UILabel * retweetContentLabel;
/** 转发配图 */
//@property (nonatomic, weak) AnnaContentPhotosView * retweetPhotosView;

/**
 *  微博工具栏
 */
//@property (nonatomic, weak)AnnaStatuToolsBar *statuToolsBar;

@end

@implementation AnnaStatusCell

+(AnnaStatusCell *)statusCellWithTableView:(UITableView *)tableView{
    static NSString *statusCellIdentifier = @"homeStatusCellIdentifier";
    
    AnnaStatusCell *statusCell = [tableView dequeueReusableCellWithIdentifier:statusCellIdentifier];
    
    if (statusCell == nil) {
        statusCell = [[AnnaStatusCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:statusCellIdentifier];
    }

    return statusCell;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    return self;
    AnnaLog(@"%s",__func__);
}
#warning 这种已经被苹果官方改变的控件.有自己独特的init方法.所以如果不是自己显式调用.本控件初始化的时候是不会自动调用initWithCoder或者initWithFrame的
 -(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
     self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
     
//     原创微博部分
     UIView *originView = [[UIView alloc]init];
     self.originView = originView;
     [self.contentView addSubview:originView];
     
//     初始化头像
     UIImageView *iconImageView = [[UIImageView alloc]init];
     self.iconImageView = iconImageView;
     [self.originView addSubview:iconImageView];
     
//     初始化姓名label
     UILabel *nameLabel = [[UILabel alloc]init];
     self.nameLabel = nameLabel;
     self.nameLabel.font = nameLabelFont;
     [self.originView addSubview:nameLabel];
     
//     初始化vip图标
     UIImageView *vipImageView = [[UIImageView alloc]init];
     self.vipImageView = vipImageView;
     [self.originView addSubview:vipImageView];
     
//     初始化timeLabel
     UILabel *timeLabel = [[UILabel alloc]init];
     self.timeLabel = timeLabel;
     self.timeLabel.font = timeLabelFont;
     [self.originView addSubview:timeLabel];
     
//     初始化sourceLabel
     UILabel *sourceLabel = [[UILabel alloc]init];
     self.sourceLabel = sourceLabel;
     self.sourceLabel.font = sourceLabelFont;
     [self.originView addSubview:sourceLabel];
     
//     初始化微博正文
     UILabel *contentLabel = [[UILabel alloc]init];
     self.contentLabel = contentLabel;
     self.contentLabel.numberOfLines = 0;
     self.contentLabel.font = contentLabelFont;
     [self.originView addSubview:contentLabel];
     
//     初始化微博配图
     AnnaContentPhotosView *contentPhotosView = [[AnnaContentPhotosView alloc]init];
     self.contentPhotosView = contentPhotosView;
     [self.originView addSubview:contentPhotosView];
     
//     转发微博体
     
     return self;
 }
 

-(void)setStatusFrameModel:(AnnaStatusFrameModel *)statusFrameModel{
    
//    提取模型
    _statusFrameModel = statusFrameModel;
    AnnaStatusModel *statusModel = statusFrameModel.statusModel;
    AnnaUserModel *userModel = statusModel.user;
    
//    头像
    self.iconImageView.frame = statusFrameModel.iconImageViewFrame;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:userModel.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    
//    姓名
    self.nameLabel.frame = statusFrameModel.nameLabelFrame;
    self.nameLabel.text = userModel.name;

//    vip图标
    self.vipImageView.frame = statusFrameModel.vipImageViewFrame;
//    为了以后可能需要增加vip类型而不在cell初始化时设置
    if (userModel.vip) {
        
        self.vipImageView.image = [UIImage imageNamed:@"common_icon_membership"];
        self.vipImageView.hidden = NO;
        self.nameLabel.textColor = [UIColor orangeColor];
    } else {
        
        self.vipImageView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    
//    来源label
    self.sourceLabel.frame = statusFrameModel.sourceLabelFrame;
    self.sourceLabel.text = statusModel.sourceLabelText;
    
//    时间label
    self.timeLabel.frame = statusFrameModel.timeLabelFrame;
    self.timeLabel.size = [statusModel.created_at sizeWithFont:timeLabelFont];
    self.timeLabel.text = statusModel.created_at;
    
    if ([statusModel.created_at isEqualToString:@"刚刚"]) {
    
        self.timeLabel.textColor = [UIColor orangeColor];
    } else {
        
        self.timeLabel.textColor = [UIColor blackColor];
    }
    
//    正文label
    self.contentLabel.frame = statusFrameModel.contentLabelFrame;
    self.contentLabel.text = statusModel.text;
    
//    自定义微博配图控件
    self.contentPhotosView.frame = statusFrameModel.contentPhotosViewFrame;
    if (statusModel.pic_urls) {
        self.contentPhotosView.thumbnail_pic = statusModel.pic_urls;
        
    } else {
        self.contentPhotosView.frame = CGRectZero;
    }
    
//    原创微博整体
    self.originView.frame = statusFrameModel.originViewFrame;
}


@end
