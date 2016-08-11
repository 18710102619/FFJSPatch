//
//  HomeViewController.m
//  WBJSPatch
//
//  Created by 张玲玉 on 16/1/16.
//  Copyright © 2016年 bj.58.com. All rights reserved.
//

#import "FFRootViewController.h"

@interface FFRootViewController ()

@end

@implementation FFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *push = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, kScreen_Width-100, 50)];
    [push setBackgroundColor:[UIColor orangeColor]];
    [push setTitle:@"Push" forState:UIControlStateNormal];
    [push addTarget:self action:@selector(clickPush:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:push];
}

- (void)clickPush:(id)sender
{
    
}

@end
