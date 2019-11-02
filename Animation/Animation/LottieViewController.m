//
//  LottieViewController.m
//  Animation
//
//  Created by 李正林 on 2019/2/21.
//  Copyright © 2019 李正林. All rights reserved.
//

#import "LottieViewController.h"
#import <Lottie/Lottie.h>
#import "MusicPlayerHelper.h"

@interface LottieViewController ()

@property (nonatomic, assign) BOOL isAnimating;

@end

@implementation LottieViewController

- (IBAction)thumbAnimation:(id)sender {
    
    [self runLotAnimationViewWithAnimationName:@"thumb"];
}

- (IBAction)heartAnimation:(id)sender {
    
    [self runLotAnimationViewWithAnimationName:@"heart"];
}

- (IBAction)trophyAnimation:(id)sender {
    
    [self runLotAnimationViewWithAnimationName:@"trophy"];
}

/**
 LotAnimation的动画实现

 @param animationName 动画名称
 */
- (void)runLotAnimationViewWithAnimationName:(NSString *)animationName {
    
    if (self.isAnimating) return;
    LOTAnimationView *animationView = [LOTAnimationView animationNamed:animationName];
    animationView.contentMode = UIViewContentModeScaleAspectFill;
    animationView.frame = CGRectMake(self.view.frame.size.width/2-150, 100, 300, 200);
    animationView.animationProgress = 0;
    [animationView play];
    [self.view addSubview:animationView];
    self.isAnimating = YES;
    
    // 实现动画音效
    [MusicPlayerHelper playAudioWithAudioName:@"like_normal_audio"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [animationView removeFromSuperview];
        self.isAnimating = NO;
    });
}

- (void)dealloc {
    
    NSLog(@"LottieViewController - dealloc is called...");
}

@end
