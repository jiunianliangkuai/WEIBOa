//
//  AnnaImageLeftButton.h
//  weiboa
//
//  Created by Liangkuai on 16/5/3.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnnaImageLeftButton : UIButton

@property (assign, nonatomic)BOOL selectedImageAnimated;

+ (instancetype)buttonWithImage:(UIImage *)iamge highlightImage:(UIImage *)highlightImage title:(NSString *)title font:(UIFont *)font;

+ (instancetype)buttonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title font:(UIFont *)font;

@end
