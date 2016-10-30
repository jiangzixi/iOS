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
@end