//
// Created by 姜梓烯 on 2016/11/4.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChatCellFrameModel;


@interface ChatBaseCell : UITableViewCell

@property(nonatomic, strong) UIButton *avatarBtn;
@property(nonatomic, strong) UIImageView *msgImg;
@property(nonatomic, strong) UILabel *timeLbl;


@property(nonatomic, strong) ChatCellFrameModel *frameModel;


@end