//
//  ViewController.m
//  03-CAKeyframeAnimation-图标抖动
//
//  Created by Mac on 2019/10/22.
//  Copyright © 2019 Mac. All rights reserved.
//

#define Angle2Radian(angle) ((angle) / 180.0 * M_PI)

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)start {
    
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animation];
    anima.keyPath = @"transform.rotation";
    
    anima.values = @[@(Angle2Radian(-5)), @(Angle2Radian(5)), @(Angle2Radian(-5))];
    anima.duration = 0.25;
    // 动画的重复执行次数
    anima.repeatCount = MAXFLOAT;
    
    // 保持动画执行完毕后的状态
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    
    [self.iconView.layer addAnimation:anima forKey:@"shake"];
}

- (IBAction)stop {
    
    [self.iconView.layer removeAnimationForKey:@"shake"];
}


@end
