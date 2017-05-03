//
//  AYImagesAnimationButton.h
//  AYAnimationButton
//
//  Created by Andy on 2017/5/3.
//  Copyright © 2017年 Andy. All rights reserved.
//


/**
 
 AYImagesAnimationButton 自定义动画按钮
 
 继承于 UIImageView 有 UIImageView 的全部属性
 
 */



#import <UIKit/UIKit.h>

#define kDefaultDuration 0.5f

typedef void(^AYBeginAnimationBlock)();

typedef void(^AYClickButtonBlock)();

@interface AYImagesAnimationButton : UIImageView


@property (nonatomic , strong)NSArray<UIImage*> *images;

@property (nonatomic , strong)AYBeginAnimationBlock beginAnmationBlock;//开始动画时触发 block，关闭响应者链，避免重复触发事件

@property (nonatomic , strong)AYClickButtonBlock clickButtonBlock;//动画结束触发 block，响应点击事件

@property (nonatomic , assign)CGFloat duration;



/**
 初始化按钮

 @param frame frame
 @param images 动画图片数组
 @return 当前对象
 */
- (instancetype)initWithFrame:(CGRect)frame images:(NSArray<UIImage*>*) images;


/**
 设置动画开始对象

 @param block 动画开始回调 block
 */
- (void)ay_setBeginAnimationBlock:(AYBeginAnimationBlock)block;


/**
 动画结束回调

 @param block 动画结束回调 block
 */
- (void)ay_setClickButtonBlock:(AYClickButtonBlock)block;






@end
