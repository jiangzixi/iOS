//
// Created by 姜梓烯 on 2016/10/30.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

@class ChatMsgModel;

@interface ChatCellFrameModel : NSObject

@property(nonatomic, assign) CGRect avatarFrame;
@property(nonatomic, assign) CGRect msgFrame;
@property(nonatomic, assign) CGRect timeFrame;

@property(nonatomic, assign) CGFloat cellHeight;

@property(nonatomic, strong) NSString *timeStr;

@property(nonatomic, assign) BOOL needShowTime;

@property(nonatomic, strong) ChatMsgModel *msgModel;

+ (instancetype)frameModelWith:(ChatMsgModel *)msgModel timeStr:(NSString *)timeStr;
@end