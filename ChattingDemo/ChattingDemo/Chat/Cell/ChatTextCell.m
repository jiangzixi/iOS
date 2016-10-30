//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatTextCell.h"
#import "UITableViewCell+ZXExt.h"
#import "ChatCellFrameModel.h"
#import "ChatMsgModel.h"

@interface ChatTextCell()

@property(nonatomic, strong) UIImageView *avatarImg;
@property(nonatomic, strong) UIButton *msgBtn;
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

    _avatarImg.layer.borderWidth = 0.5;
    _avatarImg.layer.borderColor = RGBA(153,153,153,0.4).CGColor;
}

- (void)setFrameModel:(ChatCellFrameModel *)frameModel {
    _frameModel = frameModel;
    _timeLbl.frame = frameModel.timeFrame;
    _timeLbl.text = frameModel.timeStr;
    _avatarImg.frame = frameModel.avatarFrame;
    if ([frameModel.msgModel.fromId isEqualToString:kMYCHATID]) {
        _avatarImg.image = kMYAVATAR;
    } else {
        _avatarImg.image = kOTHERAVATAR;
    }
}


@end