//
//  AYAnimationButton.h
//  AYAnimationButton
//
//  Created by Andy on 2017/5/2.
//  Copyright © 2017年 Andy. All rights reserved.
//


/**
 
 AYAnimationButton 点击水波扩散效果。
 该控件继承于 UIView ，可添加子控件完成自定义。
 通过实现 ay_setBtnClickBlock 方法完成点击事件设置。
 
 */

#import <UIKit/UIKit.h>

#define kDefaultFillColor [UIColor orangeColor]
#define kDefaultStrokeColor [UIColor yellowColor]
#define kDefaultLineWidth 1
#define kDefaultDuration 0.5f




typedef void(^AYButtonClickBlock)();

@interface AYAnimationButton : UIView

@property (nonatomic , copy)AYButtonClickBlock block;

@property (nonatomic , strong)UIColor *fillColor;

@property (nonatomic , strong)UIColor *strokeColor;

@property (nonatomic , assign)CGFloat lineWidth;

@property (nonatomic , assign)CGFloat duration;





/**
 设置点击事件触发方法

 @param block 点击回调方法
 */
- (void)ay_setBtnClickBlock:(AYButtonClickBlock)block;







@end
