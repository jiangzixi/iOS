//
// Created by 姜梓烯 on 2016/10/31.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatImageCell.h"
#import "UITableViewCell+ZXExt.h"
#import "ChatCellFrameModel.h"
#import "ChatMsgModel.h"

@interface ChatImageCell ()

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

}

- (void)setFrameModel:(ChatCellFrameModel *)frameModel {
    [super setFrameModel:frameModel];
//    _msgContentImg.frame = frameModel.msgContentFrame;
    if ([frameModel.msgModel.fromId isEqualToString:kMYCHATID]) {
        //自己发的图片
        NSError *error = nil;
        NSData *imageData = [NSData dataWithContentsOfFile:[kCHATIMAGEFOLDERPATH stringByAppendingPathComponent:frameModel.msgModel.msgContent] options:NSDataReadingMappedIfSafe error:&error];
        if (!error) {
            //找到图片
            UIImageView *image = self.msgImg;
            CAShapeLayer *layer = [CAShapeLayer layer];
            layer.frame = self.msgImg.bounds;
            layer.contents = (id)self.msgImg.image.CGImage;
            layer.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1);
            layer.contentsScale = [UIScreen mainScreen].scale;
            image.layer.mask = layer;
            image.layer.frame = image.frame;
            image.image = [UIImage imageWithData:imageData];
        } else {
            //没找到图片
        }
    } else {

    }
}


@end