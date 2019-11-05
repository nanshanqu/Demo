//
//  DouDongViewController.m
//  Animation
//
//  Created by Mac on 2019/11/5.
//  Copyright © 2019 李正林. All rights reserved.
//

#define Angle2Radian(angle) ((angle) / 180.0 * M_PI)

#import "DouDongViewController.h"

@interface DouDongViewController ()

@property (strong, nonatomic) UIImageView *iconView;

@end

@implementation DouDongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 60, 60)];
    self.iconView.image = [UIImage imageNamed:@"3.jpg"];
    [self.view addSubview:self.iconView];
    
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.frame = CGRectMake(20, 400, 100, 30);
    startBtn.backgroundColor = [UIColor blueColor];
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    UIButton *stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    stopBtn.frame = CGRectMake(300, 400, 100, 30);
    stopBtn.backgroundColor = [UIColor blueColor];
    [stopBtn setTitle:@"停止" forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(stopBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
}

- (void)startBtnAction {
    
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

- (void)stopBtnAction {
    
    [self.iconView.layer removeAnimationForKey:@"shake"];
}

@end
