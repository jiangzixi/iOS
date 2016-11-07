//
// Created by 姜梓烯 on 2016/10/30.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatCellFrameModel.h"
#import "ChatMsgModel.h"
#import "SDImageCache.h"

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
        _avatarFrame = CGRectMake(PHONEWIDTH-avatarMargin-avatarWidth, _timeFrame.origin.y+_timeFrame.size.height + 13, avatarWidth, avatarWidth);
    } else {
        _avatarFrame = CGRectMake(avatarMargin,_timeFrame.origin.y+_timeFrame.size.height+13,avatarWidth,avatarWidth);
    }
    if (msgModel.msgType==chatMsgTypeText) {
        CGRect strRect = [msgModel.msgContent boundingRectWithSize:CGSizeMake(PHONEWIDTH-2*avatarWidth-2*avatarMargin-48, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];//发送内容的Frame
        if ([msgModel.fromId isEqualToString:kMYCHATID]) {
            //自己发送的
            _msgImgFrame = CGRectMake(PHONEWIDTH-2*avatarWidth-2*avatarMargin-strRect.size.width+6,_avatarFrame.origin.y-2,strRect.size.width+36,strRect.size.height+36);
            _msgLblFrame = CGRectMake(18,14,strRect.size.width,strRect.size.height);
        } else {
            //对方发送的
            _msgImgFrame = CGRectMake(_avatarFrame.origin.x+_avatarFrame.size.width+5,_avatarFrame.origin.y-2,strRect.size.width+36,strRect.size.height+36);
            _msgLblFrame = CGRectMake(18,14,strRect.size.width,strRect.size.height);
        }
    } else if (msgModel.msgType==chatMsgTypeImage) {
        if ([msgModel.fromId isEqualToString:kMYCHATID]) {
            //自己发送的
            NSError *error = nil;
            NSData *imageData = [NSData dataWithContentsOfFile:[kCHATIMAGEFOLDERPATH stringByAppendingPathComponent:msgModel.msgContent] options:NSDataReadingMappedIfSafe error:&error];
            if (!error) {
                UIImage *image = [UIImage imageWithData:imageData];
                CGSize size = [self imageSize:image];
                NSLog(@"%@",NSStringFromCGSize(size));
                _msgImgFrame = CGRectMake(PHONEWIDTH-avatarWidth-2*avatarMargin-size.width,_avatarFrame.origin.y-2,size.width,size.height);
//                _msgContentFrame = CGRectMake(0,0,_msgImgFrame.size.width,_msgImgFrame.size.height);
            } else {
                _msgImgFrame = CGRectMake(PHONEWIDTH-avatarWidth-2*avatarMargin-50,_avatarFrame.origin.y-2,50,50);
//                _msgContentFrame = CGRectMake(0,0,_msgImgFrame.size.width,_msgImgFrame.size.height);
            }
//            _msgImgFrame = CGRectMake(PHONEWIDTH-2*avatarWidth-2*avatarMargin-strRect.size.width+6,_avatarFrame.origin.y-2,strRect.size.width+36,strRect.size.height+36);

        } else {
            //对方发送的
//            _msgImgFrame = CGRectMake(_avatarFrame.origin.x+_avatarFrame.size.width+5,_avatarFrame.origin.y-2,strRect.size.width+36,strRect.size.height+36);
            //自己发送的
//            NSError *error = nil;
//            NSData *imageData = [NSData dataWithContentsOfFile:[kCHATIMAGEFOLDERPATH stringByAppendingPathComponent:msgModel.msgContent] options:NSDataReadingMappedIfSafe error:&error];
//            if (!error) {
//                UIImage *image = [UIImage imageWithData:imageData];
//                CGSize size = [self imageSize:image];
//                NSLog(@"%@",NSStringFromCGSize(size));
//                _msgImgFrame = CGRectMake(_avatarFrame.origin.x+_avatarFrame.size.width+5,_avatarFrame.origin.y-2,size.width,size.height);
//            } else {
//                _msgImgFrame = CGRectMake(_avatarFrame.origin.x+_avatarFrame.size.width+5,_avatarFrame.origin.y-2,50,50);
//            }

            UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:self.msgModel.msgContent];
            if (image) {
                CGSize size = [self imageSize:image];
                _msgImgFrame = CGRectMake(_avatarFrame.origin.x+_avatarFrame.size.width+5,_avatarFrame.origin.y,size.width,size.height);
            } else {
                _msgImgFrame = CGRectMake(_avatarFrame.origin.x+_avatarFrame.size.width+5,_avatarFrame.origin.y,50,50);
            }
        }
    }
    _cellHeight = _msgImgFrame.origin.y + _msgImgFrame.size.height + 6;
}

- (CGSize)imageSize:(UIImage *)image{
    CGSize size = image.size;
    CGSize newSize = CGSizeZero;
    if (size.width>PHONEWIDTH/2) {
        newSize.width = PHONEWIDTH/2;
        newSize.height = size.height*newSize.width/size.width;
    } else {
        newSize = size;
    }
    size = newSize;
    newSize = CGSizeZero;
    if (size.height>PHONEHEIGHT/3) {
        newSize.height = PHONEHEIGHT/3;
        newSize.width = size.width*newSize.height/size.height;
    } else {
        newSize = size;
    }
    return newSize;
}




@end