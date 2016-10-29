//
//  ViewController.m
//  JiangTestStrMem
//
//  Created by 姜梓烯 on 2016/9/25.
//  Copyright (c) 2016 tempRT. All rights reserved.
//


#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *a = @"test";
    NSString *b = @"test";
    NSString *c = [[NSString alloc] initWithString:@"test"];
    NSLog(@"%p-----%p-----%p",a,b,c);
    NSLog(@"%d",a==b);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end