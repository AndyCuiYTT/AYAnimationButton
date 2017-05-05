//
//  AYImagesAnimationButton.m
//  AYAnimationButton
//
//  Created by Andy on 2017/5/3.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "AYImagesAnimationButton.h"

@interface AYImagesAnimationButton ()<CAAnimationDelegate>

@end

@implementation AYImagesAnimationButton

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray<UIImage *> *)images{
    if (self = [super initWithFrame:frame]) {
        self.image = [images firstObject];
        NSMutableArray *imgArray = [NSMutableArray array];
        for (UIImage *img in images) {
            [imgArray addObject:(__bridge UIImage*)img.CGImage];
        }
        _images = [imgArray copy];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setImages:(NSArray<UIImage *> *)images{
    
    if (images.count == 0) {
        return;
    }
    
    self.image = [images firstObject];
    NSMutableArray *imgArray = [NSMutableArray array];
    for (UIImage *img in images) {
        [imgArray addObject:(__bridge UIImage*)img.CGImage];
    }
    _images = [imgArray copy];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches anyObject];
    if ([self pointInside:[touch locationInView:self] withEvent:nil]) {
        
        if (_beginAnmationBlock) {
            _beginAnmationBlock();
        }
        
        
        
        //关键针动画
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
        animation.duration = _duration ? _duration : kDefaultDuration;
        animation.delegate = self;
        animation.values = _images;
        [self.layer addAnimation:animation forKey:nil];
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (_clickButtonBlock) {
        _clickButtonBlock();
    }
}

- (void)ay_setClickButtonBlock:(AYClickButtonBlock)block{
    _clickButtonBlock = block;
}

- (void)ay_setBeginAnimationBlock:(AYBeginAnimationBlock)block{
    _beginAnmationBlock = block;
}



@end
