//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import <Foundation/Foundation.h>

//UIKIT_EXTERN NSNotificationName const kToolBarViewChangeHeighNotification;
static const CGFloat moreViewHeigh = 224;
static const NSString *kToolBarViewChangeHeighNotification = @"kToolBarViewChangeHeighNotification";

@interface ToolBarView : UIView

@property(nonatomic, strong) UITextView *inputView;


- (void)resetFrame;
@end