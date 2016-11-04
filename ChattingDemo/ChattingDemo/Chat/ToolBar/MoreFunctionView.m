//
// Created by 姜梓烯 on 2016/10/31.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "MoreFunctionView.h"
#import "FunctionBtn.h"

@implementation MoreFunctionView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    self.backgroundColor = RGBA(245, 245, 246, 1);
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, PHONEWIDTH, 1)];
    topLine.backgroundColor = RGBA(215, 215, 217, 1);
    [self addSubview:topLine];

    FunctionBtn *picBtn = [[FunctionBtn alloc] initWithFrame:CGRectMake((PHONEWIDTH-4*FunctionBtnWidth)/5,15,FunctionBtnWidth,72)];
    [picBtn setImage:[UIImage imageNamed:@"sharemore_pic"] HLImage:nil title:@"照片"];
    [self addSubview:picBtn];

    FunctionBtn *cameraBtn = [[FunctionBtn alloc] initWithFrame:CGRectMake(picBtn.rightX+25,picBtn.y,FunctionBtnWidth,72)];
    [cameraBtn setImage:[UIImage imageNamed:@"sharemore_video"] HLImage:nil title:@"拍照"];
    [self addSubview:cameraBtn];

    FunctionBtn *picBtn2 = [[FunctionBtn alloc] initWithFrame:CGRectMake((PHONEWIDTH-4*FunctionBtnWidth)/5,108,FunctionBtnWidth,72)];
    [picBtn2 setImage:[UIImage imageNamed:@"sharemore_pic"] HLImage:nil title:@"照片"];
    [self addSubview:picBtn2];

    FunctionBtn *cameraBtn2 = [[FunctionBtn alloc] initWithFrame:CGRectMake(picBtn.rightX+25,108,FunctionBtnWidth,72)];
    [cameraBtn2 setImage:[UIImage imageNamed:@"sharemore_video"] HLImage:nil title:@"拍照"];
    [self addSubview:cameraBtn2];

}

@end