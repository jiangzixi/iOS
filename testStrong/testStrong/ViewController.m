//
//  ViewController.m
//  testStrong
//
//  Created by 姜梓烯 on 2016/7/13.
//  Copyright © 2016年 姜梓烯. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak,nonatomic) NSString *nStr;
@property (weak,nonatomic) ViewController *nVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"aaa";
    _nStr = str;
    NSLog(@"%p---%p",str,_nStr);
    str = nil;
    NSLog(@"%p---%p",str,_nStr);
    
    ViewController *new = [[ViewController alloc] init];
    _nVC = new;
    NSLog(@"%p---%p",new,_nVC);
    new = nil;
    NSLog(@"%p---%p",new,_nVC);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
