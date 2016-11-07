//
// Created by 姜梓烯 on 2016/11/7.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "ZXDownloadImageManager.h"
#import "UIImageView+WebCache.h"

@interface ZXDownloadImageManager()

@property(nonatomic, strong) NSMutableArray *downloadingArr;

@end

@implementation ZXDownloadImageManager

+ (instancetype)shareManager{
    static ZXDownloadImageManager *manager;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        if (!manager) {
            manager = [ZXDownloadImageManager new];
            manager.downloadingArr = [NSMutableArray array];
        }
    });
    return manager;
}

- (void)downloadImageWithUrlStr:(NSString *)urlStr complete:(ZXdownloadImageCompleteBlock)block{
    if ([_downloadingArr containsObject:urlStr]) {
        return;
    }
    [_downloadingArr addObject:urlStr];
    UIImageView *imageView = [UIImageView new];
    [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSString *imagePath = [kCHATIMAGEFOLDERPATH stringByAppendingPathComponent:urlStr];
        NSData *imageData = UIImagePNGRepresentation(image);
        NSError *writeError = nil;
        if (![[NSFileManager defaultManager] fileExistsAtPath:kCHATIMAGEFOLDERPATH]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:kCHATIMAGEFOLDERPATH withIntermediateDirectories:YES attributes:nil error:nil];
        }
        [imageData writeToFile:imagePath options:NSDataWritingAtomic error:&error];
//        if (!error && !writeError) {
        [_downloadingArr removeObject:urlStr];
            block(image);
//        }
    }];
}

@end