//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatTextCell.h"
#import "UITableViewCell+ZXExt.h"
#import "ChatCellFrameModel.h"
#import "ChatMsgModel.h"

@interface ChatTextCell()

@property(nonatomic, strong) UIButton *avatarBtn;
@property(nonatomic, strong) UIImageView *msgImg;
@property(nonatomic, strong) UILabel *textLbl;
@property(nonatomic, strong) UILabel *timeLbl;

@end

@implementation ChatTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    self.backgroundColor = [UIColor clearColor];
    [self initMyUI];
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    _timeLbl.font = [UIFont systemFontOfSize:11];
    _timeLbl.textAlignment = NSTextAlignmentCenter;
    _timeLbl.backgroundColor = RGBA(206,206,206,1);
    _timeLbl.textColor = [UIColor whiteColor];
    _timeLbl.layer.cornerRadius = 5;
    _timeLbl.layer.masksToBounds = YES;

    _avatarBtn.layer.borderWidth = 0.5;
    _avatarBtn.layer.borderColor = RGBA(153,153,153,0.4).CGColor;

    [_textLbl removeFromSuperview];
    _textLbl.font = [UIFont systemFontOfSize:16];
    _textLbl.numberOfLines = 0;
    _textLbl.textColor = [UIColor blackColor];
    [_msgImg addSubview:_textLbl];
}

- (void)setFrameModel:(ChatCellFrameModel *)frameModel {
    _frameModel = frameModel;
    _timeLbl.frame = frameModel.timeFrame;
    _timeLbl.text = frameModel.timeStr;
    _avatarBtn.frame = frameModel.avatarFrame;
    _msgImg.frame = frameModel.msgImgFrame;
    _textLbl.frame = frameModel.msgLblFrame;
    _textLbl.text = frameModel.msgModel.msgContent;
    if ([frameModel.msgModel.fromId isEqualToString:kMYCHATID]) {
        [_avatarBtn setImage:kMYAVATAR forState:UIControlStateNormal];
        UIImage *norImg = [UIImage imageNamed:@"message_sender_bg"];
        _msgImg.image = [norImg resizableImageWithCapInsets:UIEdgeInsetsMake(15,15,15,30)];
        UIImage *hlImg = [UIImage imageNamed:@"message_sender_bgHL"];
        _msgImg.highlightedImage = [hlImg resizableImageWithCapInsets:UIEdgeInsetsMake(15,15,15,30)];
    } else {
        [_avatarBtn setImage:kOTHERAVATAR forState:UIControlStateNormal];
        _msgImg.image = [[UIImage imageNamed:@"message_receiver_bg"] stretchableImageWithLeftCapWidth:20 topCapHeight:30];
        _msgImg.highlightedImage = [[UIImage imageNamed:@"message_receiver_bgHL"] stretchableImageWithLeftCapWidth:20 topCapHeight:30];
    }
//    [_msgImg layoutIfNeeded];
}


@end