//
// Created by 姜梓烯 on 2016/11/4.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatBaseCell.h"
#import "ChatCellFrameModel.h"
#import "ChatMsgModel.h"
#import "UITableViewCell+ZXExt.h"


@interface ChatBaseCell()

@end

@implementation ChatBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSelf];
    }
    return self;
}

- (void)initSelf{
    [self initMyUI:ChatBaseCell.class];

    _timeLbl.font = [UIFont systemFontOfSize:11];
    _timeLbl.textAlignment = NSTextAlignmentCenter;
    _timeLbl.backgroundColor = RGBA(206,206,206,1);
    _timeLbl.textColor = [UIColor whiteColor];
    _timeLbl.layer.cornerRadius = 5;
    _timeLbl.layer.masksToBounds = YES;

    _avatarBtn.layer.borderWidth = 0.5;
    _avatarBtn.layer.borderColor = RGBA(153,153,153,0.4).CGColor;

}

- (void)setFrameModel:(ChatCellFrameModel *)frameModel {
    _frameModel = frameModel;
    _timeLbl.frame = frameModel.timeFrame;
    _timeLbl.text = frameModel.timeStr;
    _avatarBtn.frame = frameModel.avatarFrame;
    _msgImg.frame = frameModel.msgImgFrame;
    if ([frameModel.msgModel.fromId isEqualToString:kMYCHATID]) {
        [_avatarBtn setImage:kMYAVATAR forState:UIControlStateNormal];
        UIImage *norImg = [UIImage imageNamed:@"message_sender_bg"];
        _msgImg.image = [norImg resizableImageWithCapInsets:UIEdgeInsetsMake(30,15,15,45)];
        UIImage *hlImg = [UIImage imageNamed:@"message_sender_bgHL"];
        _msgImg.highlightedImage = [hlImg resizableImageWithCapInsets:UIEdgeInsetsMake(30,15,15,45)];
    } else {
        [_avatarBtn setImage:kOTHERAVATAR forState:UIControlStateNormal];
        _msgImg.image = [[UIImage imageNamed:@"message_receiver_bg"] stretchableImageWithLeftCapWidth:20 topCapHeight:30];
        _msgImg.highlightedImage = [[UIImage imageNamed:@"message_receiver_bgHL"] stretchableImageWithLeftCapWidth:20 topCapHeight:30];
    }
//    [_msgImg layoutIfNeeded];
}


@end