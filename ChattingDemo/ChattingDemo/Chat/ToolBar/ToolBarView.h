//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import <Foundation/Foundation.h>


static const CGFloat moreViewHeigh = 224;

@protocol ToolBarViewDelegate <NSObject>

@optional
- (void)addATextMsg:(NSString *)string;


- (void)toolBarDidChangeFrame:(CGRect)frame;

@end

@interface ToolBarView : UIView

@property(nonatomic, strong) UITextView *inputView;
@property(nonatomic, weak) id<ToolBarViewDelegate>delegate;

- (void)resetFrame;
@end