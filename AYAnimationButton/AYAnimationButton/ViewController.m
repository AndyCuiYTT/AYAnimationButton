//
//  ViewController.m
//  AYAnimationButton
//
//  Created by Andy on 2017/5/2.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "ViewController.h"
#import "AYAnimationButton.h"
#import "AYImagesAnimationButton.h"

@interface ViewController ()<CAAnimationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    AYAnimationButton *btn = [[AYAnimationButton alloc] initWithFrame:CGRectMake(100 , 50, 100, 100)];
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    btn.layer.mask = layer;
    
    btn.backgroundColor = [UIColor cyanColor];
    [btn ay_setBtnClickBlock:^{
        NSLog(@"ddddddddddd");
    }];
    [self.view addSubview:btn];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
        

    AYImagesAnimationButton *imgBtn = [[AYImagesAnimationButton alloc] initWithFrame:CGRectMake(100, 200, 100, 150) images:@[[UIImage imageNamed:@"1.tiff"],[UIImage imageNamed:@"2.tiff"],[UIImage imageNamed:@"3.tiff"],[UIImage imageNamed:@"4.tiff"],[UIImage imageNamed:@"5.tiff"],[UIImage imageNamed:@"6.tiff"],[UIImage imageNamed:@"7.tiff"],[UIImage imageNamed:@"8.tiff"]]];
    
    
    [imgBtn ay_setBeginAnimationBlock:^{
        self.view.userInteractionEnabled = NO;
    }];
    
    
    [imgBtn ay_setClickButtonBlock:^{
        self.view.userInteractionEnabled = YES;
        NSLog(@"ssssssss");
    }];
    
    
    [self.view addSubview:imgBtn];
}

//动画结束后执行
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"dddddddd");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
