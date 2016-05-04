//
//  AnnaImageLeftButton.m
//  weiboa
//
//  Created by Liangkuai on 16/5/3.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaImageLeftButton.h"
#import "NSString+Extension.h"

#define kMargin 10

@interface AnnaImageLeftButton ()

@property (nonatomic, strong)UIFont *font;

@end

@implementation AnnaImageLeftButton

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

#pragma mark - 返回图像在右边的Button
+ (instancetype)buttonWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage title:(NSString *)title font:(UIFont *)font{
    
    AnnaImageLeftButton *imageLeftButton = [[AnnaImageLeftButton alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    imageLeftButton.font = font;
    
    [imageLeftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [imageLeftButton setImage:image forState:UIControlStateNormal];
    [imageLeftButton setTitle:title forState:UIControlStateNormal];
    [imageLeftButton setImage:highlightImage forState:UIControlStateHighlighted];
    
    return imageLeftButton;
}

+ (instancetype)buttonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title font:(UIFont *)font{
    
    AnnaImageLeftButton *imageLeftButton = [[AnnaImageLeftButton alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    imageLeftButton.font = font;
    
    [imageLeftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [imageLeftButton setImage:image forState:UIControlStateNormal];
    [imageLeftButton setTitle:title forState:UIControlStateNormal];
    [imageLeftButton setImage:selectedImage forState:UIControlStateSelected];

    return imageLeftButton;
}
// 目的：想在系统计算和设置完按钮的尺寸后，再修改一下尺寸
#warning 不需要在知道文字后计算titleView的size.直接在button中就会有写好的button的size.想多了
/**
 *  重写setFrame:方法的目的：拦截设置按钮尺寸的过程
 *  如果想在系统设置完控件的尺寸后，再做修改，而且要保证修改成功，一般都是在setFrame:中设置
 */
- (void)setFrame:(CGRect)frame
{
    frame.size.width += kMargin;
    [super setFrame:frame];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 如果仅仅是调整按钮内部titleLabel和imageView的位置，那么在layoutSubviews中单独设置位置即可
    
//    // 1.计算titleLabel的frame
//    self.titleLabel.x = self.imageView.x;
//    
//    // 2.计算imageView的frame
//    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + kMargin;
    
    self.titleLabel.x = self.titleLabel.x - self.imageView.width ;
    
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + kMargin;
}



- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    // 只要修改了文字，就让按钮重新计算自己的尺寸
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    
    // 只要修改了图片，就让按钮重新计算自己的尺寸
    [self sizeToFit];
}

#pragma mark - 如果设置了selected图像,是否通过动画显示
#warning 还需要进一步完善(button的imageView不能单独调整aplha)
-(void)setSelectedImageAnimated:(BOOL)selectedImageAnimated{
    if (selectedImageAnimated) {
//        如果选择了selected动画,就禁用高亮渲染
        self.adjustsImageWhenHighlighted = NO;
    }
    _selectedImageAnimated = selectedImageAnimated;
}

#pragma mark - 动画
-(void)setSelected:(BOOL)selected{
    if (!self.selectedImageAnimated) {
        [super setSelected:selected];
        return;
    }
    
    [self setImage:nil forState:UIControlStateSelected];
    CGFloat imageViewX = self.imageView.x;
#warning 不知道为什么需要固定一下self.image.x
    if (!self.selected) {
        [UIView animateWithDuration:0.5 animations:^{
            self.imageView.x = imageViewX;
            self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.imageView.x = imageViewX;
            self.imageView.transform = CGAffineTransformIdentity;
        }];
    }
    [super setSelected:selected];

}
@end
