//
// Created by 姜梓烯 on 2016/10/30.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "NSDate+Ext.h"


@implementation NSDate (Ext)


+ (NSString *)dateWithTimeInterval:(NSTimeInterval)interval format:(NSString *)formating {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formating];
    return [dateFormatter stringFromDate:date];
}

+ (BOOL)compareTimeDate:(NSString *)str date2:(NSString *)str2 {
    NSInteger old = str.integerValue;
    NSInteger new = str2.integerValue;
    return (old-new) / 120 > 1;
}

+ (NSString *)TimeDifferenceTransformation:(NSString *)str {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];
    NSString *datestring = [NSDate dateWithTimeInterval:str.longLongValue format:@"yyyy/MM/dd HH:mm:ss"];
    NSDateFormatter *dm = [[NSDateFormatter alloc] init];
    [dm setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSDate *newdate = [dm dateFromString:datestring];
    long dd = [datenow timeIntervalSince1970] - str.longLongValue;
    NSString *timeString;
    if (dd / 86400 > 1) {
        timeString = [NSDate dateWithTimeInterval:str.floatValue format:@"yyyy/MM/dd HH:mm"];
    } else {
        timeString = [NSDate dateWithTimeInterval:str.floatValue format:@"HH:mm"];
    }
    return timeString;
}


@end