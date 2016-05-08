//
//  AnnaWeiboGroupController.h
//  weiboa
//
//  Created by Liangkuai on 16/5/9.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnnaWeiboGroupController;

typedef NS_ENUM(NSInteger, AnnaWeiboGroupType) {
    AnnaWeiboGroupTypeHome = 0,
    AnnaWeiboGroupTypeFriend,
    AnnaWeiboGroupTypeSelf ,
    AnnaWeiboGroupTypeNotSelect = 0,
};

@protocol weiboGroupControllerDelegate <NSObject>

- (void)weiboGroupControllerDidSelectGroup:(AnnaWeiboGroupType)type;

@end

@interface AnnaWeiboGroupController : UITableViewController

@property (assign, nonatomic)id<weiboGroupControllerDelegate> delegate;

@end


