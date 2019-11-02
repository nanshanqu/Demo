//
//  TransformViewController.m
//  Animation
//
//  Created by 李正林 on 2019/2/21.
//  Copyright © 2019 李正林. All rights reserved.
//

#import "TransformViewController.h"

@interface TransformViewController ()
@property (weak, nonatomic) IBOutlet UIButton *headIcon;

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)up:(id)sender {
    
    [UIView animateWithDuration:1.0 animations:^{
        
        self.headIcon.transform = CGAffineTransformTranslate(self.headIcon.transform, 0, -50);
    }];
}

- (IBAction)down:(id)sender {
    
    [UIView animateWithDuration:1.0 animations:^{
        
        self.headIcon.transform = CGAffineTransformTranslate(self.headIcon.transform, 0, 50);
    }];
}

- (IBAction)big:(id)sender {
    
    self.headIcon.transform = CGAffineTransformScale(self.headIcon.transform, 1.5, 1.5);
}

- (IBAction)small:(id)sender {
    
    self.headIcon.transform = CGAffineTransformScale(self.headIcon.transform, 0.5, 0.5);
}

- (IBAction)leftRotate:(id)sender {
    
    self.headIcon.transform = CGAffineTransformRotate(self.headIcon.transform, -M_PI_4);
}

- (IBAction)rightRotate:(id)sender {
    
    self.headIcon.transform = CGAffineTransformRotate(self.headIcon.transform, M_PI_4);
}

- (void)dealloc {
    
    NSLog(@"TransformViewController - dealloc is called...");
}


@end
