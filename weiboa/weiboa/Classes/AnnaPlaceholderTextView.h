//
//  AnnaPlaceholderTextView.h
//  weiboa
//
//  Created by Liangkuai on 16/5/8.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnnaPlaceholderTextView : UITextView

/**
 *  占位符文本
 */
@property (copy, nonatomic)NSString *placeholderText;

/**
 *  占位符字体(和文本字体)
 */
@property (strong, nonatomic)UIFont *textFont;

/**
 *  直接通过类方法返回已经完成好的占位符textView
 *
 *  @param placeholder 文本
 *  @param textFont    字体
 *
 */
+ (instancetype)placeholderTextViewWithText:(NSString *)placeholder Font:(UIFont *)textFont;

@end
