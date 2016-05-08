//
//  AnnaPlaceholderTextView.h
//  weiboa
//
//  Created by Liangkuai on 16/5/8.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnnaPlaceholderTextView : UITextView

@property (copy, nonatomic)NSString *placeholderText;

+ (instancetype)placeholderTextView;

@end
