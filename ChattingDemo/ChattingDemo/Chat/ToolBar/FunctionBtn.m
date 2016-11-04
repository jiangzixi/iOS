//
// Created by 姜梓烯 on 2016/10/31.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "FunctionBtn.h"


@implementation FunctionBtn

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {


    }
    return self;
}

- (void)setImage:(UIImage *)image HLImage:(UIImage *)hlImage title:(NSString *)title{
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:hlImage forState:UIControlStateHighlighted];
    self.imageView.backgroundColor = RGBA(252,252,252,1);
    self.imageView.layer.borderColor = RGBA(215, 215, 217, 1).CGColor;
    self.imageView.layer.borderWidth = 1;
    self.imageView.layer.cornerRadius = 15;
    self.imageView.layer.masksToBounds = YES;
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:RGBA(136,136,136,1) forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0,0,FunctionBtnWidth,FunctionBtnWidth);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0,66,FunctionBtnWidth,12);
}

@end