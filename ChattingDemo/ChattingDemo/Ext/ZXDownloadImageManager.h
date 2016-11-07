//
// Created by 姜梓烯 on 2016/11/7.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ZXdownloadImageCompleteBlock)(UIImage *image);


@interface ZXDownloadImageManager : NSObject


+ (instancetype)shareManager;


- (void)downloadImageWithUrlStr:(NSString *)urlStr complete:(ZXdownloadImageCompleteBlock)block;
@end