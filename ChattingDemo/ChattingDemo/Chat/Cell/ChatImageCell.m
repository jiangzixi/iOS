//
// Created by 姜梓烯 on 2016/10/31.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatImageCell.h"
#import "UITableViewCell+ZXExt.h"
#import "ChatCellFrameModel.h"
#import "ChatMsgModel.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"

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
//    if ([frameModel.msgModel.fromId isEqualToString:kMYCHATID]) {
//        //自己发的图片
    NSError *error = nil;
    NSData *imageData = [NSData dataWithContentsOfFile:[kCHATIMAGEFOLDERPATH stringByAppendingPathComponent:frameModel.msgModel.msgContent] options:NSDataReadingMappedIfSafe error:&error];
    if (!error) {
        //找到图片
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.frame = self.msgImg.bounds;
        layer.contents = (id) self.msgImg.image.CGImage;
        layer.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1);
        layer.contentsScale = [UIScreen mainScreen].scale;
        self.msgImg.layer.mask = layer;
        self.msgImg.layer.frame = self.msgImg.frame;
        self.msgImg.image = [UIImage imageWithData:imageData];
    } else if (frameModel.msgModel.msgContent.length > 4 && [frameModel.msgModel.msgContent hasPrefix:@"http"]) {
        //没找到图片
        UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:frameModel.msgModel.msgContent];
        if (image) {
            CAShapeLayer *layer = [CAShapeLayer layer];
            layer.frame = self.msgImg.bounds;
            layer.contents = (id) self.msgImg.image.CGImage;
            layer.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1);
            layer.contentsScale = [UIScreen mainScreen].scale;
            self.msgImg.layer.mask = layer;
            self.msgImg.layer.frame = self.msgImg.frame;
            self.msgImg.image = image;
        } else {
            WS(ws)
            [self.msgImg sd_setImageWithURL:[NSURL URLWithString:frameModel.msgModel.msgContent] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if ((cacheType == 0 && error == nil) || (cacheType == SDImageCacheTypeDisk && error == nil)) {
                    ChatCellFrameModel *newFrameModel = [ChatCellFrameModel frameModelWith:frameModel.msgModel timeStr:frameModel.timeStr];
                    [_delegate chatImageCellReplaceOldFrame:frameModel toNewModel:newFrameModel];
                }
            }];
        }

//            [[UIImageView new] sd_setImageWithURL:[NSURL URLWithString:frameModel.msgModel.msgContent] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                NSString *imagePath = [kCHATIMAGEFOLDERPATH stringByAppendingPathComponent:frameModel.msgModel.msgContent];
//                NSData *data = UIImagePNGRepresentation(image);
//                [data writeToFile:imagePath options:NSDataWritingWithoutOverwriting error:&error];
//                ChatCellFrameModel *newFrameModel = [ChatCellFrameModel frameModelWith:frameModel.msgModel timeStr:frameModel.timeStr];
//                self.frameModel = newFrameModel;
//            }];
    }
//    }
}


@end