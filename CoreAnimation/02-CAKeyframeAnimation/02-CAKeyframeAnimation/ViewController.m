//
//  ViewController.m
//  02-CAKeyframeAnimation
//
//  Created by Mac on 2019/10/22.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [self animationWithMove];
    [self animationWithPosition];
    
}

- (void)animationWithMove {
    
    // CABasicAnimation fromValue --> toValue
    
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animation];
    
    anima.keyPath = @"position";
    
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointZero];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(100, 0)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(0, 200)];
    anima.values = @[v1, v2, v3, v4];
    
//    anima.keyTimes = @[@(0.5), @(0.25), @(0.25)];
    
    anima.duration = 2.0;
    
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    
    [self.redView.layer addAnimation:anima forKey:nil];
}

- (void)animationWithPosition {
    
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animation];
    
    anima.keyPath = @"position";
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    anima.duration = 2.0;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(100, 100, 200, 200));
    anima.path = path;
    CGPathRelease(path);
    
    // 设置动画的执行节奏
    // kCAMediaTimingFunctionEaseInEaseOut : 一开始比较慢, 中间会加速,  临近结束的时候, 会变慢
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anima.delegate = self;
    
    [self.redView.layer addAnimation:anima forKey:nil];
}

#pragma mark - 动画的代理方法

#pragma mark 动画开始的时候调用
- (void)animationDidStart:(CAAnimation *)anim {
    
    NSLog(@"animationDidStart");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    NSLog(@"animationDidStop");
}

@end
