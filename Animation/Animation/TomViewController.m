//
//  TomViewController.m
//  Animation
//
//  Created by 李正林 on 2019/2/21.
//  Copyright © 2019 李正林. All rights reserved.
//

#import "TomViewController.h"

@interface TomViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tomImageView;

@end

@implementation TomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)knockout:(id)sender {
    
    [self runAnimationWithCount:81 name:@"knockout"];
}

- (IBAction)stomach:(id)sender {
    
    [self runAnimationWithCount:34 name:@"stomach"];
}

- (IBAction)footRight:(id)sender {
    
    [self runAnimationWithCount:30 name:@"footRight"];
}

- (IBAction)footLeft:(id)sender {
    
    [self runAnimationWithCount:30 name:@"footLeft"];
}

- (IBAction)angry:(id)sender {
    
    [self runAnimationWithCount:26 name:@"angry"];
}

- (IBAction)drink:(id)sender {
    
    [self runAnimationWithCount:81 name:@"drink"];
}

- (IBAction)cymbal:(id)sender {
    
    [self runAnimationWithCount:13 name:@"cymbal"];
}

- (IBAction)pie:(id)sender {
    
    [self runAnimationWithCount:24 name:@"pie"];
}

- (IBAction)eat:(id)sender {
    
    [self runAnimationWithCount:40 name:@"eat"];
}

- (IBAction)scratch:(id)sender {
    
    [self runAnimationWithCount:56 name:@"scratch"];
}

- (IBAction)fart:(id)sender {
    
    [self runAnimationWithCount:28 name:@"fart"];
}

/**
 序列帧动画实现

 @param count 总的图片张数
 @param name 图片名称
 */
- (void)runAnimationWithCount:(NSInteger)count name:(NSString *)name {
    
    if (self.tomImageView.isAnimating) return;
    
    NSMutableArray *imageArray = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%@_%02ld.jpg",name, i];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
//        UIImage *image = [UIImage imageNamed:fileName];
        [imageArray addObject:image];
    }
    self.tomImageView.animationImages = imageArray;
    self.tomImageView.animationRepeatCount = 1;
    self.tomImageView.animationDuration = imageArray.count * 0.15;
    [self.tomImageView startAnimating];
    
    CGFloat delay = self.tomImageView.animationDuration + 1.5;
    [self.tomImageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:delay];
}

- (void)dealloc {
    
    NSLog(@"TomViewController - dealloc is called...");
}


@end
