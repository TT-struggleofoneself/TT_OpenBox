//
//  ViewController.m
//  TT_OpenBox
//
//  Created by TT_code on 16/4/6.
//  Copyright © 2016年 TT_code. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置父试图旋转  有一点3D效果。

    CGFloat angle =  -M_PI*1/5;
    self.ttview.layer.transform=CATransform3DMakeRotation(angle, 1, 0, 1);
    
}


@end
