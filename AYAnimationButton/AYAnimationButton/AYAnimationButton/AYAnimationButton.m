//
//  AYAnimationButton.m
//  AYAnimationButton
//
//  Created by Andy on 2017/5/2.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "AYAnimationButton.h"

@interface AYAnimationButton ()<CAAnimationDelegate>


@property (nonatomic , strong)CAShapeLayer *shapeLayer;

@end

@implementation AYAnimationButton


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CAShapeLayer *shapeLayer = self.shapeLayer;
    
    CGFloat width = self.bounds.size.width,height = self.bounds.size.height;
    
    CGFloat maxRadius = sqrt(width * width  + height * height) / 2 + 30;
    CGFloat minRadius = 5;
    
    UIBezierPath *beginPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width / 2, height / 2) radius:minRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    UIBezierPath *endPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width / 2, height / 2) radius:maxRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    shapeLayer.strokeColor = (_strokeColor ? _strokeColor : kDefaultStrokeColor).CGColor;
    shapeLayer.lineWidth = (_lineWidth ? _lineWidth : kDefaultLineWidth);
    shapeLayer.fillColor = (_fillColor ? _fillColor : kDefaultFillColor).CGColor;
    [self.layer addSublayer:shapeLayer];
    
    CABasicAnimation *circleAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    circleAnimation.fromValue = (__bridge id _Nullable)(beginPath.CGPath);
    circleAnimation.toValue = (__bridge id _Nullable)(endPath.CGPath);
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @1;
    alphaAnimation.toValue = @0;
    
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    animation.animations = @[circleAnimation, alphaAnimation];
    animation.delegate = self;
    animation.duration = _duration ? _duration : kDefaultDuration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [shapeLayer addAnimation:animation forKey:nil];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    if ([self pointInside:[touch locationInView:self] withEvent:nil]) {
        if (_block) {
            _block();
        }
    }
    
    NSLog(@"结束");
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"cancel");
}


- (void)ay_setBtnClickBlock:(AYButtonClickBlock)block{
    self.block = block;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.shapeLayer removeFromSuperlayer];
}

- (CAShapeLayer *)shapeLayer{
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
    }
    return _shapeLayer;
}






@end
