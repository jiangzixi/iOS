//
// Created by 姜梓烯 on 2016/7/10.
// Copyright (c) 2016 jiangzixi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BinaryTree : NSObject

@property(strong, nonatomic) BinaryTree *present;
@property(assign, nonatomic) int presentNum;
@property(assign, nonatomic) int left;
@property(strong, nonatomic) BinaryTree *leftTree;
@property(assign, nonatomic) int right;
@property(strong, nonatomic) BinaryTree *rightTree;

@end