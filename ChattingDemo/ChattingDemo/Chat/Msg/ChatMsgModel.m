//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatMsgModel.h"


@implementation ChatMsgModel

- (instancetype)init {
    if (self = [super init]) {
        [self removeNullToEmptyString];
    }
    return self;
}



@end