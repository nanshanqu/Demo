//
//  CATransitionViewController.m
//  Animation
//
//  Created by Mac on 2019/11/5.
//  Copyright © 2019 李正林. All rights reserved.
//

#import "CATransitionViewController.h"

@interface CATransitionViewController ()

@property (strong, nonatomic)UIImageView *iconView;

/// 当前图片的索引
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.iconView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.iconView.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:self.iconView];
    
    UIButton *preBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    preBtn.frame = CGRectMake(20, 400, 60, 30);
    preBtn.backgroundColor = [UIColor blueColor];
    [preBtn setTitle:@"pre" forState:UIControlStateNormal];
    [preBtn addTarget:self action:@selector(preBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:preBtn];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake(300, 400, 100, 30);
    nextBtn.backgroundColor = [UIColor blueColor];
    [nextBtn setTitle:@"next" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
}

- (void)preBtnAction {
    
    self.currentIndex--;
    if (self.currentIndex == -1) {
        self.currentIndex = 8;
    }
    
    NSString *fileName = [NSString stringWithFormat:@"%ld.jpg", self.currentIndex + 1];
    self.iconView.image = [UIImage imageNamed:fileName];
    
    CATransition *anima = [CATransition animation];
//    anima.type = @"cube";
//    anima.subtype = kCATransitionFromLeft;
    anima.type = @"pageUnCurl";
    anima.duration = 0.5;
    [self.view.layer addAnimation:anima forKey:nil];
    
}

- (void)nextBtnAction {
    
    self.currentIndex++;
    if (self.currentIndex == 9) {
        self.currentIndex = 0;
    }
    
    NSString *fileName = [NSString stringWithFormat:@"%ld.jpg", self.currentIndex + 1];
    self.iconView.image = [UIImage imageNamed:fileName];
    
    // 转场动画
    CATransition *anima = [CATransition animation];
    anima.type = @"pageCurl";
//    anima.subtype = kCATransitionFromRight;
    anima.duration = 0.5;
    
//    anima.startProgress = 0.0;
//    anima.endProgress = 0.5;
    
    [self.view.layer addAnimation:anima forKey:nil];
}

@end
