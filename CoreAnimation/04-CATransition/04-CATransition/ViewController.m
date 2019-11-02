//
//  ViewController.m
//  04-CATransition
//
//  Created by Mac on 2019/10/22.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

/// 当前图片的索引
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)pre {
    
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

- (IBAction)next {
    
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
