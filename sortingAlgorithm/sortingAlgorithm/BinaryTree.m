//
// Created by 姜梓烯 on 2016/7/10.
// Copyright (c) 2016 jiangzixi. All rights reserved.
//

#import "BinaryTree.h"


@implementation BinaryTree

- (instancetype)init {
    if (self = [super init]) {
        _present = nil;
        _presentNum = 0;
        _left = 0;
        _leftTree = nil;
        _right = 0;
        _rightTree = nil;
    }
    return self;
}

@end