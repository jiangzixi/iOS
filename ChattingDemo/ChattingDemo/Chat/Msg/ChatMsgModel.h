//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    chatMsgTypeText = 0,
    chatMsgTypeImage = 1,
    chatMsgTypeVoice = 2
} chatMsgType;


@interface ChatMsgModel : NSObject

@property(nonatomic, strong) NSString *msgId;
@property(nonatomic, strong) NSString *fromId;
@property(nonatomic, strong) NSString *toId;
@property(nonatomic, strong) NSString *time;
@property(nonatomic, assign) chatMsgType msgType;
@property(nonatomic, strong) NSString *msgContent;

@end