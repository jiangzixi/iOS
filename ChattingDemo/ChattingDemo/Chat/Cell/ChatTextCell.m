//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ChatTextCell.h"

@interface ChatTextCell()

@property(nonatomic, strong) UIImageView *avatarIv;
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

}


@end