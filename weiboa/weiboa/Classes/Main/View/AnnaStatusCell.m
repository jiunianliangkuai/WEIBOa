
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

//@property (weak, nonatomic)AnnaContentPhotosView *contentPhotosView;


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
     
     UIImageView *iconImageView = [[UIImageView alloc]init];
     self.iconImageView = iconImageView;
     [self.contentView addSubview:iconImageView];
     
     UILabel *nameLabel = [[UILabel alloc]init];
     self.nameLabel = nameLabel;
     self.nameLabel.font = nameLabelFont;
     [self.contentView addSubview:nameLabel];
     
     UIImageView *vipImageView = [[UIImageView alloc]init];
     self.vipImageView = vipImageView;
     [self.contentView addSubview:vipImageView];
     
     UILabel *timeLabel = [[UILabel alloc]init];
     self.timeLabel = timeLabel;
     self.timeLabel.font = timeLabelFont;
     [self.contentView addSubview:timeLabel];
     
     UILabel *sourceLabel = [[UILabel alloc]init];
     self.sourceLabel = sourceLabel;
     self.sourceLabel.font = sourceLabelFont;
     [self.contentView addSubview:sourceLabel];
     
     UILabel *contentLabel = [[UILabel alloc]init];
     self.contentLabel = contentLabel;
     self.contentLabel.numberOfLines = 0;
     self.contentLabel.font = contentLabelFont;
     [self.contentView addSubview:contentLabel];
     
     
     return self;
 }
 

-(void)setStatusFrameModel:(AnnaStatusFrameModel *)statusFrameModel{
    
    _statusFrameModel = statusFrameModel;
    AnnaStatusModel *statusModel = statusFrameModel.statusModel;
    AnnaUserModel *userModel = statusModel.user;
    
    self.iconImageView.frame = statusFrameModel.iconImageViewFrame;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:userModel.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    
    self.nameLabel.frame = statusFrameModel.nameLabelFrame;
    self.nameLabel.text = userModel.name;

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
    
    self.sourceLabel.frame = statusFrameModel.sourceLabelFrame;
    self.sourceLabel.text = statusModel.sourceLabelText;
    
    self.timeLabel.frame = statusFrameModel.timeLabelFrame;
    self.timeLabel.size = [statusModel.created_at sizeWithFont:timeLabelFont];
    self.timeLabel.text = statusModel.created_at;
    
    if ([statusModel.created_at isEqualToString:@"刚刚"]) {
    
        self.timeLabel.textColor = [UIColor orangeColor];
    } else {
        
        self.timeLabel.textColor = [UIColor blackColor];
    }
    
    self.contentLabel.frame = statusFrameModel.contentLabelFrame;
    self.contentLabel.text = statusModel.text;
    
}


@end
