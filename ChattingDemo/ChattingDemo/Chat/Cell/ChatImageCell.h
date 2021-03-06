//
// Created by 姜梓烯 on 2016/10/31.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatBaseCell.h"

@protocol ChatImageCellDelegate <NSObject>

- (void)chatImageCellReplaceOldFrame:(ChatCellFrameModel *)oldFrameModel toNewModel:(ChatCellFrameModel *)newModel;

@end

@interface ChatImageCell : ChatBaseCell

@property(nonatomic, weak) id<ChatImageCellDelegate>delegate;

@end