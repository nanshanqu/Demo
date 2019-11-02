//
//  SequentialViewController.m
//  Animation
//
//  Created by 李正林 on 2019/2/21.
//  Copyright © 2019 李正林. All rights reserved.
//

#import "SequentialViewController.h"
#import "MusicPlayerHelper.h"

@interface SequentialViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *sequentialImageView;

@end

@implementation SequentialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)sqquentialAnimation:(id)sender {
    
    [self runAnimationWithCount:30 name:@"like_normal_0000"];
}

/**
 序列帧动画实现

 @param count 总的图片张数
 @param name 图片名称
 */
- (void)runAnimationWithCount:(NSInteger)count name:(NSString *)name {
    
    if (self.sequentialImageView.isAnimating) return;
    NSMutableArray *imagesArray = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%@%ld",name,i + 1];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        [imagesArray addObject:image];
    }
    self.sequentialImageView.animationImages = imagesArray;
    self.sequentialImageView.animationRepeatCount = 1;
    self.sequentialImageView.animationDuration = imagesArray.count * 0.1;
    [self.sequentialImageView startAnimating];
    CGFloat delay = self.sequentialImageView.animationDuration + 1.0;
    [self.sequentialImageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:delay];
    [MusicPlayerHelper playAudioWithAudioName:@"like_normal_audio"];
}

- (void)dealloc {
    
    NSLog(@"SequentialViewController - dealloc is called...");
}

@end
