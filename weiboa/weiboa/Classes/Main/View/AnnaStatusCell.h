//
//  AnnaStatusCell.h
//  weiboa
//
//  Created by Liangkuai on 16/5/4.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnnaStatusFrameModel;

@interface AnnaStatusCell : UITableViewCell

@property (strong, nonatomic)AnnaStatusFrameModel *statusFrameModel;

+(AnnaStatusCell *)statusCellWithTableView:(UITableView *)tableView;
@end
