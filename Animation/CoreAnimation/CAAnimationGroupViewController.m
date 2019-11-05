//
//  CAAnimationGroupViewController.m
//  Animation
//
//  Created by Mac on 2019/11/5.
//  Copyright © 2019 李正林. All rights reserved.
//

#import "CAAnimationGroupViewController.h"

@interface CAAnimationGroupViewController ()

@property (strong, nonatomic)UIView *myView;

@end

@implementation CAAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)setupUI {

self.view.backgroundColor = [UIColor whiteColor];

self.myView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
self.myView.backgroundColor = [UIColor greenColor];
[self.view addSubview:self.myView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 1.创建旋转动画对象
    CABasicAnimation *rotate = [CABasicAnimation animation];
    rotate.keyPath = @"transform.rotation";
    rotate.toValue = @(M_PI);
    
    // 2.创建缩放动画对象
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    scale.toValue = @(0.0);
    
    // 3.平移动画
    CABasicAnimation *move = [CABasicAnimation animation];
    move.keyPath = @"transform.translation";
    move.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    
    // 4.将所有的动画添加到动画组中
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[rotate, scale, move];
    group.duration = 2.0;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    
    [self.myView.layer addAnimation:group forKey:nil];
}

@end
