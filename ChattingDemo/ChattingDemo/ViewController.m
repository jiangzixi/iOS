//
//  ViewController.m
//  ChattingDemo
//
//  Created by 姜梓烯 on 2016/10/29.
//  Copyright © 2016年 姜梓烯. All rights reserved.
//

#import "ViewController.h"
#import "ChatVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0,0,200,20);
    [btn addTarget:self action:@selector(pushBtn) forControlEvents:UIControlEventTouchUpInside];
    btn.center = self.view.center;
    [self.view addSubview:btn];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)pushBtn {
    ChatVC *vc = [ChatVC new];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
