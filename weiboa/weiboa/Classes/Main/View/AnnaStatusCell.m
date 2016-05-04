
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
    AnnaStatusCell *statusCell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    
    AnnaStatusFrameModel *statusFrameModel = statusCell.statusFrameModel;
    AnnaStatusModel *statusModel = statusFrameModel.statusModel;
    AnnaUserModel *userModel = statusModel.user;
    
    UIImageView *iconImageView = [[UIImageView alloc]init];
    statusCell.iconImageView = iconImageView;
    [iconImageView sd_setImageWithURL:[NSURL URLWithString:userModel.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    [statusCell.contentView addSubview:iconImageView];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    statusCell.nameLabel = nameLabel;
    [statusCell.contentView addSubview:nameLabel];
    
    UIImageView *vipImageView = [[UIImageView alloc]init];
    statusCell.vipImageView = vipImageView;
    [statusCell.contentView addSubview:vipImageView];
    
    UILabel *timeLabel = [[UILabel alloc]init];
    statusCell.timeLabel = timeLabel;
    [statusCell.contentView addSubview:timeLabel];
    
    UILabel *sourceLabel = [[UILabel alloc]init];
    statusCell.sourceLabel = sourceLabel;
    [statusCell.contentView addSubview:sourceLabel];
    
    UILabel *contentLabel = [[UILabel alloc]init];
    statusCell.contentLabel = contentLabel;
    [statusCell.contentView addSubview:contentLabel];
    
    return statusCell;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    AnnaStatusFrameModel *statusFrameModel = self.statusFrameModel;
    AnnaStatusModel *statusModel = statusFrameModel.statusModel;
    AnnaUserModel *userModel = statusModel.user;
    
    UIImageView *iconImageView = [[UIImageView alloc]init];
    self.iconImageView = iconImageView;
    [iconImageView sd_setImageWithURL:[NSURL URLWithString:userModel.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    [self.contentView addSubview:iconImageView];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    self.nameLabel = nameLabel;
    [self.contentView addSubview:nameLabel];
    
    UIImageView *vipImageView = [[UIImageView alloc]init];
    self.vipImageView = vipImageView;
    [self.contentView addSubview:vipImageView];
    
    UILabel *timeLabel = [[UILabel alloc]init];
    self.timeLabel = timeLabel;
    [self.contentView addSubview:timeLabel];
    
    UILabel *sourceLabel = [[UILabel alloc]init];
    self.sourceLabel = sourceLabel;
    [self.contentView addSubview:sourceLabel];
    
    UILabel *contentLabel = [[UILabel alloc]init];
    self.contentLabel = contentLabel;
    [self.contentView addSubview:contentLabel];
    
    
    return self;
}

-(void)setStatusFrameModel:(AnnaStatusFrameModel *)statusFrameModel{
    
    _statusFrameModel = statusFrameModel;
    
    self.iconImageView.frame = statusFrameModel.iconImageViewFrame;
    
    self.nameLabel.frame = statusFrameModel.nameLabelFrame;
    
    self.vipImageView.frame = statusFrameModel.vipImageViewFrame;
    
    self.sourceLabel.frame = statusFrameModel.sourceLabelFrame;
    
    self.timeLabel.frame = statusFrameModel.timeLabelFrame;
    
    self.contentLabel.frame = statusFrameModel.contentLabelFrame;
    
}


@end
