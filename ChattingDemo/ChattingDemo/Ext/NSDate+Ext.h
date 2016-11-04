//
// Created by 姜梓烯 on 2016/10/30.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Ext)
+ (NSString *)dateWithTimeInterval:(NSTimeInterval)interval format:(NSString *)formating;

+ (BOOL)compareTimeDate:(NSString *)oldTime date2:(NSString *)newTime ;

+ (NSString *)TimeDifferenceTransformation:(NSString *)str;
@end