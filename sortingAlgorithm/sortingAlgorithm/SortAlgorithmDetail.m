//
// Created by 姜梓烯 on 2016/7/9.
// Copyright (c) 2016 jiangzixi. All rights reserved.
//

#import "SortAlgorithmDetail.h"
#import <UIKit/UIKit.h>


@implementation SortAlgorithmDetail


+ (instancetype)shareSortAlgorithm{
    static SortAlgorithmDetail *detail = nil;
    static dispatch_once_t once;
    dispatch_once(&once,^{
       detail = [[self alloc] init];
    });
    return detail;
}

+ (NSMutableArray *)sortingByBubble {
    NSMutableArray *resultArr = [NSMutableArray arrayWithCapacity:8];
    int a[] = {12, 42, 54, 13, 34, 76, 33, 43};
    //冒泡
    //sizeof(x)获取x在内存中占用多少容量
    int len = sizeof(a) / sizeof(a[0]);
    for (int i = 0; i < len; i++) {
        for (int j = 0; j < len - i - 1; j++) {
            if (a[j] > a[j + 1]) {
                int temp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = temp;
            }
            //显示当前排序的位置以及当前数组的顺序
            NSString *str = [NSString stringWithFormat:@"%d个循环%d次", i, j];
            for (int k = 0; k < len; k++) {
                str = [str stringByAppendingFormat:@"%d  ", a[k]];
            }
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:str];
            [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange((NSUInteger) (j * 4 + 6), 6)];
            [resultArr addObject:string];
        }
    }
    return resultArr;
}


@end