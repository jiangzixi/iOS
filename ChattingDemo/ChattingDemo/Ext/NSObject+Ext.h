//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Ext)


+ (NSMutableArray<NSString *> *)getModelAllPropertyName;

- (void)removeNullToEmptyString;
@end