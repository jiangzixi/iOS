//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatTextCell.h"
#import "UITableViewCell+ZXExt.h"
#import "ChatCellFrameModel.h"
#import "ChatMsgModel.h"

@interface ChatTextCell()


@property(nonatomic, strong) UILabel *textLbl;

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



    [_textLbl removeFromSuperview];
    _textLbl.font = [UIFont systemFontOfSize:16];
    _textLbl.numberOfLines = 0;
    _textLbl.textColor = [UIColor blackColor];
    [self.msgImg addSubview:_textLbl];
}

- (void)setFrameModel:(ChatCellFrameModel *)frameModel {
    [super setFrameModel:frameModel];
    _textLbl.frame = frameModel.msgLblFrame;
    _textLbl.text = frameModel.msgModel.msgContent;
    if ([frameModel.msgModel.fromId isEqualToString:kMYCHATID]) {

    } else {

    }
//    [_msgImg layoutIfNeeded];
}


@end