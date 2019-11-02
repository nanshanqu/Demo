//
//  ViewController.m
//  01-CABasicAnimation
//
//  Created by Mac on 2019/10/22.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer * layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CALayer *layer = [CALayer layer];
    layer.position = CGPointMake(100, 100);
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    self.layer = layer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self animationWithTranslate];
//    [self animationWithScale];
//    [self animationWithRotate];
//    [self animationWithTransform];
}

/// 平移
- (void)animationWithTranslate {
    
    // 1.创建动画对象
    CABasicAnimation *anima = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画，调整哪个属性来执行动画
    anima.keyPath = @"position";
//    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    // toValue : 最终变成什么值
    // byValue : 增加多少值
    anima.byValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    anima.duration = 2.0;
    
    /**让图层保持动画执行完毕后的状态**/
    // 动画执行完毕后不要删除动画
    anima.removedOnCompletion = NO;
    // 保持最新的状态
    anima.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anima forKey:nil];
}

/// 缩放
- (void)animationWithScale {
    
    // 1.创建动画对象
    CABasicAnimation *anima = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画，调整哪个属性来执行动画
    anima.keyPath = @"bounds";
//    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anima.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    anima.duration = 2.0;
    
    /**让图层保持动画执行完毕后的状态**/
    // 动画执行完毕后不要删除动画
    anima.removedOnCompletion = NO;
    // 保持最新的状态
    anima.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anima forKey:nil];
}

/// 旋转
- (void)animationWithRotate {
    
    // 1.创建动画对象
    CABasicAnimation *anima = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画，调整哪个属性来执行动画
    anima.keyPath = @"transform";
//    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, -1, 0)];
    anima.duration = 2.0;
    
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anima forKey:nil];
}

/// 变换
- (void)animationWithTransform {
    
    // 1.创建动画对象
    CABasicAnimation *anima = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画，调整哪个属性来执行动画
//     anima.keyPath = @"transform.rotation";
//     anima.keyPath = @"transform.scale.x";
    anima.keyPath = @"transform.translation.x";
    anima.toValue = @(100);
//    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    anima.duration = 2.0;
    
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anima forKey:nil];
}


@end
