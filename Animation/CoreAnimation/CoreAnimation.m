//
//  CoreAnimation.m
//  Animation
//
//  Created by Mac on 2019/11/5.
//  Copyright © 2019 李正林. All rights reserved.
//

#import "CoreAnimation.h"
#import "CABasicAnimationViewController.h"
#import "CAKeyframeAnimationViewController.h"
#import "DouDongViewController.h"
#import "CATransitionViewController.h"
#import "CAAnimationGroupViewController.h"

@interface CoreAnimation ()

@end

@implementation CoreAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)basicAnima {
    
    [self.navigationController pushViewController:[CABasicAnimationViewController new] animated:YES];
}

- (IBAction)keyframeAnima {
    
    [self.navigationController pushViewController:[CAKeyframeAnimationViewController new] animated:YES];
}

- (IBAction)doudongAnima {
    
    [self.navigationController pushViewController:[DouDongViewController new] animated:YES];
}

- (IBAction)transitionAnima {
    
    [self.navigationController pushViewController:[CATransitionViewController new] animated:YES];
}

- (IBAction)animationGroup {
    
    [self.navigationController pushViewController:[CAAnimationGroupViewController new] animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
