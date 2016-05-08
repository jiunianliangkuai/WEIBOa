
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
#import "AnnaStatusToolsBar.h"
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

@property (weak, nonatomic)AnnaStatusToolsBar *statusToolsBar;

/** 转发微博整体 */
@property (nonatomic, weak) UIView * retweetView;
/** 转发微博正文 + 昵称 */
@property (nonatomic, weak) UILabel * retweetContentLabel;
/** 转发配图 */
@property (nonatomic, weak) AnnaContentPhotosView * retweetPhotosView;

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
     
//     取消选中高亮
     self.selectionStyle = UITableViewCellSelectionStyleNone;
     
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
     self.sourceLabel.textColor = [UIColor grayColor];
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
     UIView *retweetView = [[UIView alloc]init];
     self.retweetView = retweetView;
     self.retweetView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_retweet_background"]];
     [self.contentView addSubview:retweetView];
     
//     初始化转发微博文本
     UILabel *retweetContentLabel = [[UILabel alloc]init];
     self.retweetContentLabel = retweetContentLabel;
     self.retweetContentLabel.numberOfLines = 0;
     [self.retweetView addSubview:retweetContentLabel];
     
//     初始化转发微博图片
     AnnaContentPhotosView *reweetPhotosView = [[AnnaContentPhotosView alloc]init];
     self.retweetPhotosView = reweetPhotosView;
     [self.retweetView addSubview:reweetPhotosView];
     
//     初始化工具栏
     AnnaStatusToolsBar *statusToolsBar = [[AnnaStatusToolsBar alloc]init];
     self.statusToolsBar = statusToolsBar;
     [self.contentView addSubview:statusToolsBar];
     
     return self;
 }
 

/**
 *  通过导入的微博Frame模型计算frame
 */
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
//    时间label
    self.timeLabel.text = statusModel.created_at;
    self.timeLabel.frame = [self timeLabelFrame];
    
//    来源label
    self.sourceLabel.frame = [self sourceLabelFrame];
    self.sourceLabel.text = statusModel.sourceLabelText;
    
    if ([statusModel.created_at isEqualToString:@"刚刚"]) {
        
        self.timeLabel.textColor = [UIColor orangeColor];
    } else {
        
        self.timeLabel.textColor = [UIColor grayColor];
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
    
    if (!statusModel.retweeted_status) {
        
        self.retweetView.frame = CGRectZero;
        self.retweetContentLabel.frame = CGRectZero;
        self.retweetPhotosView.frame = CGRectZero;
        
        self.retweetView.hidden = YES;
        
    }else {
        self.retweetView.hidden = NO;
//        转发微博
//        取出模型
        AnnaStatusModel *retweetStatus = statusModel.retweeted_status;
        
        self.retweetContentLabel.attributedText = [self setupRetweetContentText:retweetStatus];
        self.retweetContentLabel.frame = statusFrameModel.retweetContentLabelFrame;
        if (!retweetStatus.pic_urls) {
            
            self.retweetPhotosView.frame = CGRectZero;
            self.retweetView.frame = statusFrameModel.retweetViewFrame;
            
            self.retweetPhotosView.hidden = YES;

        } else {
            self.retweetPhotosView.frame = statusFrameModel.retweetPhotosViewFrame;
            self.retweetPhotosView.thumbnail_pic = retweetStatus.pic_urls;

            self.retweetView.frame = statusFrameModel.retweetViewFrame;
            
            self.retweetPhotosView.hidden = NO;
        }
    }
    
    self.statusToolsBar.frame = statusFrameModel.statusToolsBarFrame;
}

#pragma mark - 计算来源和时间的frame(因为这两需要时时更新
-(CGRect)timeLabelFrame{
    //    计算timeLabel的frame
    CGFloat timeLabelX = self.nameLabel.x;
    CGFloat timeLabelY = CGRectGetMaxY(self.nameLabel.frame) + kMargin;
    CGSize timeLabelSize = [self.statusFrameModel.statusModel.created_at sizeWithFont:timeLabelFont];
    
    return (CGRect){{timeLabelX, timeLabelY}, timeLabelSize};
}

-(CGRect)sourceLabelFrame{
    //    计算sourceLabel的frame
    CGFloat sourceLabelX = CGRectGetMaxX(self.timeLabel.frame) + kMargin;
    CGFloat sourceLabelY = self.timeLabel.y;
    CGSize sourceLabelSize = [self.statusFrameModel.statusModel.sourceLabelText sizeWithFont:sourceLabelFont];
    return (CGRect){{sourceLabelX, sourceLabelY},sourceLabelSize};
    
}

#pragma mark - 合成转发微博的文本
-(NSAttributedString *)setupRetweetContentText:(AnnaStatusModel *)retweetStatus{
    NSString *name = [NSString stringWithFormat:@"@%@",retweetStatus.user.name];
    NSString *content = [NSString stringWithFormat:@":%@",retweetStatus.text];
    NSString *contentText = [NSString stringWithFormat:@"%@%@",name,content];
    
    NSMutableAttributedString *retweetContentText = [[NSMutableAttributedString alloc]initWithString:contentText];
    
    [retweetContentText addAttribute:NSFontAttributeName value:contentLabelFont range:NSMakeRange(0, contentText.length)];
    [retweetContentText addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, name.length)];
    
    return retweetContentText;
}

@end
