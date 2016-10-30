//
// Created by 姜梓烯 on 2016/10/30.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatCellFrameModel.h"
#import "ChatMsgModel.h"

#define avatarMargin 10 //边距
#define timeTopMargin 20
#define avatarWidth 40

@interface ChatCellFrameModel ()

@property(nonatomic, assign) BOOL msgFromMe;

@end

@implementation ChatCellFrameModel

+ (instancetype)frameModelWith:(ChatMsgModel *)msgModel timeStr:(NSString *)timeStr {
    ChatCellFrameModel *frameModel = [[ChatCellFrameModel alloc] init];
    frameModel.timeStr = timeStr;
    frameModel.msgModel = msgModel;
    return frameModel;
}

- (void)setMsgModel:(ChatMsgModel *)msgModel {
    _msgModel = msgModel;
    //时间
    if (_timeStr) {
        UILabel *tempLbl = [[UILabel alloc] init];
        tempLbl.font = [UIFont systemFontOfSize:11];
        tempLbl.text = _timeStr;
        [tempLbl sizeToFit];
        CGFloat width = tempLbl.width;
        tempLbl = nil;
        _timeFrame = CGRectMake((PHONEWIDTH-width)/2, timeTopMargin, width+20, 20);
    } else {
        _timeFrame = CGRectZero;
    }
    if ([msgModel.fromId isEqualToString:kMYCHATID]) {
        //自己发送的
        _avatarFrame = CGRectMake(avatarMargin, _timeFrame.origin.y+_timeFrame.size.height + 13, avatarWidth, avatarWidth);


    } else {
        //对方发送的
        _avatarFrame = CGRectMake(PHONEWIDTH-avatarMargin-avatarWidth,_timeFrame.origin.y+_timeFrame.size.height+13,avatarWidth,avatarWidth);


    }

    _cellHeight = _avatarFrame.origin.y+_avatarFrame.size.height+10;
}




@end