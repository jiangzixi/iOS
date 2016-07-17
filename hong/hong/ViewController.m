//
//  ViewController.m
//  hong
//
//  Created by 姜梓烯 on 16/5/17.
//  Copyright © 2016年 姜梓烯. All rights reserved.
//

#define 视图 UIView
#define 视图初始化 [[视图 申请空间] 初始化]
#define 初始化一个视图叫(A) UIView *A = [[UIView alloc] init];
#define 申请空间 alloc
#define 初始化 init
//#define 背景颜色 backgroundColor
#define 的 .
//#define 颜色
#define 背景颜色为(D) .backgroundColor = (D);
#define 红色 [UIColor redColor]
#define 我的视图 self.view
#define 添加子视图 addSubview:
#define 位置大小 frame
#define 位置大小为(A,B,C,D) frame = CGRectMake(A, B, C, D)
#define 没有返回值 void
#define 视图已经初始化 viewDidLoad
#define 上一级 super
#define 收到内存警告 didReceiveMemoryWarning



#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (没有返回值)视图已经初始化 {
    [上一级 视图已经初始化];
    初始化一个视图叫(小视图)
    小视图 背景颜色为(红色)
    小视图 的 位置大小为(0,0,100,100);
    [我的视图 添加子视图 小视图];
}

- (没有返回值)收到内存警告 {
    [上一级 收到内存警告];
}

@end
