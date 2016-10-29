//
// Created by 姜梓烯 on 2016/10/29.
// Copyright (c) 2016 姜梓烯. All rights reserved.
//

#import "NSObject+Ext.h"
#import <objc/runtime.h>

@implementation NSObject (Ext)

+ (NSMutableArray<NSString *> *)getModelAllPropertyName{
    NSMutableArray *data = [NSMutableArray arrayWithCapacity:17];
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = class_copyPropertyList(self, &propertyCount);
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t *thisProperty = propertyList + i;
        NSString *propertyName = @(property_getName(*thisProperty));
        [data addObject:propertyName];
    }
    free(propertyList);
    return data;
}

- (void)removeNullToEmptyString{
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = class_copyPropertyList(self.class, &propertyCount);
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t *thisProperty = propertyList + i;
        NSString *propertyName = @(property_getName(*thisProperty));
        if ([[self valueForKey:propertyName] isEqual:[NSNull null]] || ![self valueForKey:propertyName]) {
            [self setValue:@"" forKey:propertyName];
        }
    }
    free(propertyList);
}

@end