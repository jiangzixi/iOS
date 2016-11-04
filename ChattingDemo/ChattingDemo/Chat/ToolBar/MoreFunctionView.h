//
// Created by 姜梓烯 on 2016/10/31.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MoreFunctionDelegate <NSObject>



@end

@interface MoreFunctionView : UIView

@property(nonatomic, weak) id <MoreFunctionDelegate> delegate;


@end