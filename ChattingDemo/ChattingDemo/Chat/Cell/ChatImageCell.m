//
// Created by 姜梓烯 on 2016/10/31.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatImageCell.h"
#import "UITableViewCell+ZXExt.h"
#import "ChatCellFrameModel.h"
#import "ChatMsgModel.h"

@interface ChatImageCell()

@property(nonatomic, strong) UIButton *avatarBtn;
@property(nonatomic, strong) UIImageView *msgImg;
@property(nonatomic, strong) UIImageView *msgContentImg;
@property(nonatomic, strong) UILabel *timeLbl;

@end

@implementation ChatImageCell

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

    _msgContentImg = [[UIImageView alloc] init];
    _msgContentImg.backgroundColor = [UIColor lightGrayColor];
    _msgContentImg.contentMode = UIViewContentModeScaleAspectFill;
    _msgContentImg.clipsToBounds = YES;
    _msgContentImg.layer.masksToBounds = YES;
    _msgContentImg.layer.cornerRadius = 5.0f;
    [self.contentView addSubview:_msgContentImg];

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
        _msgImg.image = [norImg resizableImageWithCapInsets:UIEdgeInsetsMake(15,15,15,30)];
        UIImage *hlImg = [UIImage imageNamed:@"message_sender_bgHL"];
        _msgImg.highlightedImage = [hlImg resizableImageWithCapInsets:UIEdgeInsetsMake(15,15,15,30)];
    } else {
        [_avatarBtn setImage:kOTHERAVATAR forState:UIControlStateNormal];
        _msgImg.image = [[UIImage imageNamed:@"message_receiver_bg"] stretchableImageWithLeftCapWidth:20 topCapHeight:30];
        _msgImg.highlightedImage = [[UIImage imageNamed:@"message_receiver_bgHL"] stretchableImageWithLeftCapWidth:20 topCapHeight:30];
    }


//    _msgContentImg.frame = self.frameModel.msgContentFrame;
//    UIImageView *ImageView = [[UIImageView alloc] init];
//    [ImageView setFrame:_msgContentImg.frame];
//    UIImage *image = [UIImage imageNamed:[self.model.DBModel.whoSend isEqualToString:@"1"] ? @"SenderTextNodeBkg" : @"ReceiverTextNodeBkg"];
//    [ImageView setImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height / 1.5, image.size.width / 1.5, image.size.height / 2 + 1, image.size.width / 2 + 1)]];
//    CALayer *layer = ImageView.layer;
//    layer.frame = (CGRect) {{0, 0}, ImageView.layer.frame.size};
//    _msgContentImg.layer.mask = layer;
//    [_msgContentImg setNeedsDisplay];
//    [self.text setImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height / 1.5, image.size.width / 1.5, image.size.height / 2 + 1, image.size.width / 2 + 1)]];
}


@end