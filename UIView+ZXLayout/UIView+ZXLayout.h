//
//  UIView+ZXLayout.h
//
//  Created by jiang on 16-9-1.
//  Copyright (c) 2016年 jiangzixi All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZXLayout)

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat rightX;
@property (nonatomic) CGFloat bottomY;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

@end